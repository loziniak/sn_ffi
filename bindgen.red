Red [
	Name: {FFI interface and Red bindings generator for Safe Network}
]

api-root: %../github/sn_api
output: %output


letter: charset [#"A" - #"Z" #"a" - #"z" #"_"]
not-blk-delim: charset [not #"}" #"{"]
blk: [any not-blk-delim ["{" copy inside any blk "}" | ""]]

string-types: ["String" | "XorUrlBase" | "XorUrl"]


clean: function [code [string!]] [
	comment: ["//" to newline]
	cmt-block: [remove [any [space | tab] comment]]
	parse code [any [thru cmt-block]]
]

read-mod-code: function [
	path [file!]
	return: [block!]
] [
	code-file: to-red-file path
	either ".rs" = find/last path ".rs" [
		code-dir: copy/part code-file find/last/tail code-file "/"
	] [
		code-dir: dirize code-file
		code-file: rejoin [code-dir %mod.rs]
		unless exists? code-file [
			code-file: append head remove find/last copy code-dir "/" ".rs"
		]
	]

	print [code-file "……"]
	code: read code-file
	clean code

	reduce [code code-dir]
]

mod-path: copy [sn_api]
mods-to-use: copy []

scan-mod: function [
	code [string!]
	code-dir [file!]
	/local next-code next-dir
	/extern mods-to-use
] [
	string-field: [
		"pub " copy name some letter ": " copy type some letter "," newline
	]

	pub-struct: [
		"pub struct " copy name some letter " " blk (
			st-name: name
			struct: make map! compose/only [
				empty?: true
				mod: (copy mod-path)
				string-fields: (make map! [])
				methods: (make map! [])
			]
			parse inside [any [thru string-field (
				if find string-types type [
					struct/string-fields/(to word! name): type
					struct/empty?: false
				]
			)]]

			structure/pub-structs/(to word! st-name): struct
		)
	]

	impl-default: [
		"impl Default for " copy name some letter " {" (
			structure/pub-structs/(to word! name)/default?: true
		)
	]
	
; 	param: [copy param-name some letter ": " copy param-type some letter (fn-params/(param-name): param-type)]	
; 	params: ["(" (fn-params: make map! []) any thru param thru ")"]
; 	param: [copy param-name some letter]	
; 	params: ["(" (fn-params: make map! []) any thru param thru ")"]

	param: [
		["&mut self"
			| [copy param-name some letter ": " copy param-type to ["," | end] (params-map/(to word! param-name): param-type)]
		]
		["," | end]
	]
	params: [any thru param]

; 	connect 
;
; 	        &mut self,
; 	        app_keypair: Option<Keypair>,
; 	        config_path: Option<&Path>,
; 	        bootstrap_config: Option<BootstrapConfig>,
;
; 	Result<()> 
	impl: [
		"impl " copy st-name some letter " " blk (
			print st-name
			parse inside [
				any thru [
					"pub async fn " copy fn-name some letter
					"(" copy fn-params to ")" ")"
					" -> " copy fn-return to " {"
					(
						params-map: make map! []
						parse fn-params params
						method: make map! compose [
							params: (params-map)
							return: (fn-return)
						]
						structure/pub-structs/(to word! st-name)/methods/(to word! fn-name): method
						structure/pub-structs/(to word! st-name)/empty?: false
					)
				]
			]
			
		)
	]

	parse code [
		any thru [pub-struct | impl-default | impl] thru newline
	]



	mod-declare: [
		"mod " copy mod some letter ";" (
			set [next-code next-dir] read-mod-code rejoin [code-dir mod]
			scan-mod next-code next-dir		;-- recursion
		) thru newline
	]

	declared-mod-pub: [
		"pub use "
		copy mod some letter "::"
		any [copy to-use-mod some letter "::" (append mods-to-use to-use-mod)]
		copy to-use-str to ";"
	]

	new-mod-pub: [
		"pub mod " copy mod some letter (
			either mod = first mods-to-use [
				mods-to-use: next mods-to-use
			] [
				append mod-path mod
			]
		) [
			";" (
				set [next-code next-dir] read-mod-code rejoin [code-dir mod]
				scan-mod next-code next-dir		;-- recursion
			)
			| " " blk (
				print ["::" mod "……"]
				scan-mod inside code-dir		;-- recursion
			)
		] (
			either head? mods-to-use [
				remove back tail mod-path
			] [
				mods-to-use: back mods-to-use
			]
		)
	]

	parse code [
		any thru [mod-declare | declared-mod-pub | new-mod-pub] thru newline
	]
]




structure: make map! compose [
	pub-structs: (make map! [])
]

set [lib-code lib-dir] read-mod-code rejoin [dirize api-root  %src/lib.rs]
scan-mod lib-code lib-dir
probe structure


replace-args: func [
	body [string!]
	args [string!]
	vars [map!]
	/local n s
] [
	foreach [n s] load args [
		replace/all/case  body  s  vars/(to word! n)
	]
]

template-generate: function [
	tpl [string!]
	template-fragment [string!]
	delimiters [block!]
	vars [map!]
] [
	rule: reduce [to set-word! 'beginning rejoin [delimiters/1 "bg:" template-fragment " "]]
	append rule compose [copy args ["[" thru "]"] (delimiters/2)

		copy body

		to ]
	append/dup  rule  rejoin [delimiters/1 "bg-end:" template-fragment delimiters/2]  2
	append rule [
		(
			replace-args body args vars
		)
		insert beginning body
	]
	rule: compose/only [any thru (rule)]
	parse tpl rule
]

clean-tpl: function [
	tpl [string!]
	delimiters [block!]
] [
	parse tpl compose/deep [any thru remove [(delimiters/1) "bg:" copy tpname some letter " [" thru (rejoin ["]" delimiters/2])
		thru
		[(delimiters/1) "bg-end:" tpname (delimiters/2)]
	]]
]


generate-rust: function [
	tpl [string!]
] [
	delimiters: ["/*" "*/"]
	vars: make map! []

	foreach struct-name keys-of structure/pub-structs [
		struct: structure/pub-structs/(struct-name)
		unless struct/empty? [
			vars/NAME: struct-name
			vars/LOWNAME: lowercase to string! vars/NAME
	
			vars/MOD: copy ""
			foreach m struct/mod [
				append vars/MOD to string! m
				append vars/MOD "::"
			]
	
			template-generate tpl "API_IMPORT" delimiters vars
	
			if struct/default? [
				template-generate tpl "OBJ_DEFAULT" delimiters vars
			]
	
			foreach field-name keys-of struct/string-fields [
				vars/FIELDNAME: field-name
				template-generate tpl "FIELD_STRING" delimiters vars
			]

			foreach method-name keys-of struct/methods [
				vars/METHODNAME: method-name
				template-generate tpl "METHOD" delimiters vars

				params: struct/methods/(method-name)/params
				param-num: 0
				foreach param-name keys-of params [
					vars/PARAMNAME: param-name
					vars/PARAMTYPE: params/(param-name)
					vars/PARAMNUM: param-num
					template-generate tpl rejoin [vars/LOWNAME "_" vars/METHODNAME "_PARAM"] delimiters vars
					param-num: param-num + 1
				]

			]
		]
	]
	clean-tpl tpl delimiters
]

generate-red: function [
	tpl [string!]
] [
	delimiters: ["comment {" "}"]
	vars: make map! []

	foreach struct-name keys-of structure/pub-structs [
		struct: structure/pub-structs/(struct-name)
		unless struct/empty? [
			vars/NAME: lowercase to string! struct-name
			template-generate tpl "OBJ" delimiters vars
	
			if struct/default? [
				template-generate  tpl  rejoin [vars/NAME "_OBJ_DEFAULT"]  delimiters  vars
			]
	
			foreach field-name keys-of struct/string-fields [
				vars/FIELDNAME: field-name
				vars/FIELDNAME_DASH: replace to string! field-name #"_" #"-"
				template-generate  tpl  rejoin [vars/NAME "_FIELD_STRING"]  delimiters  vars
			]
		]
	]
	clean-tpl tpl delimiters
]


parse-template: function [
	tpl-path [file!]
	generator [function!]
] [
	tpl: read tpl-path

	generator tpl

	destination: rejoin [
		output
		%/
		replace  copy tpl-path  ".tpl"  ""
	]
	print ["--------→" destination]
	write  destination  tpl
]


copy-file: function [
	source [file!]
] [
	destination: rejoin [
		output
		%/
		source
	]
	print ["--------→" destination]
	write  destination  read source
]


parse-template %sn_ffi/src/lib.tpl.rs :generate-rust
parse-template %sn-ffi.tpl.red :generate-red
copy-file %sn_ffi/Cargo.toml
