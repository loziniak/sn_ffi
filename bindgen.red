Red [
	Name: {FFI interface and Red bindings generator for Safe Network}
]

api-root: %../safe
output: %output


letter: charset [#"A" - #"Z" #"a" - #"z" #"_"]
blk-chars: charset [not #"}" #"{"]
blk: [any blk-chars ["{" copy inside any blk "}" | ""]]

paren-chars: charset [not #")" #"("]
paramtype-chars: charset [not #")" #"(" #","]
paren-content: [any [[some paren-chars] | [#"(" paren-content #")"]]]
paren: [#"(" copy inside paren-content #")"]
paramtype: [some [some paramtype-chars | paren]]

blacklist: [			;-- blacklist. specify entire objects or specific methods:
						;-- "BlacklistedObject"
						;-- "OtherObject" ["blacklisted_method_1" "blacklisted_method_2"]
	"WalletClient" [
		"pay_for_records"			; param: BTreeMap<XorName
		"pay_for_storage"			; param: impl Iterator<Item = NetworkAddress>
	]
	"Files" [
		"get_local_payment_and_upload_chunk"	; param: Option<OwnedSemaphorePermit>
	]
]
blacklisted?: function [
	obj [string!]
	method [string!]
] [
	return to-logic any [
		all [						;-- blacklist entire struct
			o: find blacklist obj
			not block? first m: next o
		]
		all [						;-- blacklist by method
			block? m
			find first m method
		]
	]
]
string-types: ["String" "XorUrlBase" "XorUrl"]
ref-types: ["OwnedSemaphorePermit"]


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

mod-path: reduce [copy next find/last api-root #"/"]

scan-mod: function [
	code [string!]
	code-dir [file!]
	/local next-code next-dir
] [
	string-field: [
		"pub " copy name some letter ": " copy type some letter "," newline
	]

	pub-struct: [
		"pub struct " copy name some letter (
			st-name: name
			struct: make map! compose/only [
				empty?: true
				mod: (copy mod-path)
				string-fields: (make map! [])
				methods: (make map! [])
			]

			structure/pub-structs/(to word! st-name): struct
		) [

		[" " blk (
			parse inside [any [thru string-field (
				if find string-types type [
					struct/string-fields/(to word! name): type
					struct/empty?: false
				]
			)]]

		)] | [paren]

		]
	]

	impl-default: [
		"impl Default for " copy name some letter " {" (
			unless none? structure/pub-structs/(to word! name) [
				structure/pub-structs/(to word! name)/default?: true
			]
		)
	]
	
	param: [
		[[["&mut self" | "&self"] (method/self: true)]
			| [copy param-name some letter ": " copy param-type paramtype (method/params/(to word! param-name): param-type)]
		]
		["," | end]
	]
	params: [any thru param]

	impl: [
		"impl " copy st-name some letter " " blk (
			print st-name
			parse inside [
				any thru [
					"pub " ["async " (async: true) | (async: false)] "fn " copy fn-name some letter
					paren (fn-params: inside)
					" -> " copy fn-return to " {"
					(
						unless blacklisted? st-name fn-name [
							insert back tail fn-return ", Error"
							replace fn-return "Self" st-name
							method: make map! compose [
								params: (make map! [])
								return: (fn-return)
								self: (false)
								async: (async)
							]
							parse fn-params params
							structure/pub-structs/(to word! st-name)/methods/(to word! fn-name): method
							structure/pub-structs/(to word! st-name)/empty?: false
						]
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
; 			append mod-path mod
			set [next-code next-dir] read-mod-code rejoin [code-dir mod]
			scan-mod next-code next-dir		;-- recursion
; 			remove back tail mod-path
		) thru newline
	]

	new-mod-pub: [
		"pub mod " copy mod some letter (
			append mod-path mod
		) [
			";" (
				set [next-code next-dir] read-mod-code rejoin [code-dir mod]
				scan-mod next-code next-dir		;-- recursion
			)
			| " " blk (
				print [" ::" mod "……"]
				scan-mod inside code-dir		;-- recursion
			)
		] (
			remove back tail mod-path
		)
	]

	parse code [
		any thru [mod-declare | new-mod-pub] thru newline
	]
]




structure: make map! compose [
	pub-structs: (make map! [])
]

set [lib-code lib-dir] read-mod-code rejoin [dirize api-root  %src/lib.rs]
scan-mod lib-code lib-dir
; probe structure


replace-args: func [
	body [string!]
	args [block!]
	vars [map!]
	/local n s
] [
	foreach [n s] args [
		replace/all/case  body  s  vars/(to word! n)
	]
]

template-generate: function [
	tpl [string!]
	frag-name [string!]
	delimiters [block!]
	vars [map!]
] [
	fragment: compose [beginning: (rejoin [delimiters/1 "bg:" frag-name " "])]
	append fragment compose [
		copy args ["[" thru "]"] (delimiters/2)

		copy body

		to
	]
	append/dup  fragment  rejoin [
		delimiters/1 "bg-end:" frag-name delimiters/2
	]  2
	append fragment [
		(
			replace-args  body  load args  vars
		)
		insert beginning body
	]

	parse tpl [any thru fragment]
]

clean-tpl: function [
	tpl [string!]
	delimiters [block!]
] [
	while [
		start: find tpl start-prefix: rejoin [delimiters/1 "bg:"]
	] [
		tpl: at  start  1 + length? start-prefix
		
		name: copy/part  tpl  tpl: find tpl " "
		end: find/tail tpl rejoin [delimiters/1 "bg-end:" name delimiters/2]
		
		tpl: remove/part start end
	]
]


result-value: function [
	return-result [string!]
	return: [string!]
] [
	parse return-result ["Result<" copy value to ", Error>" thru end]
	value
]

generate-rust: function [
	tpl [string!]
	delimiters [block!]
] [
	vars: make map! []

	foreach struct-name keys-of structure/pub-structs [
		unless structure/pub-structs/(struct-name)/empty? [
			append ref-types to-string struct-name
		]
	]

	foreach struct-name sort keys-of structure/pub-structs [
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
	
			foreach field-name sort keys-of struct/string-fields [
				vars/FIELDNAME: field-name
				template-generate tpl "FIELD_STRING" delimiters vars
			]

			foreach method-name sort keys-of struct/methods [
				method: struct/methods/(method-name)
				vars/METHODNAME: method-name
				vars/RETURN: method/return
				template-generate tpl "METHOD" delimiters vars

				if method/self [
					template-generate tpl rejoin [vars/LOWNAME "_" vars/METHODNAME "_SELF"] delimiters vars
				]
				if find ref-types result-value method/return [
					template-generate tpl rejoin [vars/LOWNAME "_" vars/METHODNAME "_RETURN_REF"] delimiters vars
				]
				params: method/params
				param-num: 0
				foreach param-name keys-of params [
					vars/PARAMNAME: param-name
					vars/PARAMTYPE: params/(param-name)
					param-type: params/(param-name)
					vars/PARAMNUM: param-num
					vars/COMMA: either any [
						param-num > 0
						method/self
					] [", "] [copy ""]
					borrow: copy "";
					case [
						all [
							parse vars/PARAMTYPE [copy borrow ["&" opt "mut "] copy param-type to end]
							"&str" <> vars/PARAMTYPE
							"&[u8]" <> vars/PARAMTYPE
							not find ref-types param-type
						] [
							vars/BORROW: borrow
							vars/PARAMTYPE: param-type
						]

						find ref-types param-type [
							vars/BORROW: rejoin [borrow "std::ptr::read("]
							vars/PARAMTYPE: "usize"
							vars/PARAMNUM: rejoin [param-num " as *const " param-type ")"]
						]

						'else [
							vars/BORROW: copy ""
						]
					]
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
	delimiters [block!]
] [
	vars: make map! []

	foreach struct-name sort keys-of structure/pub-structs [
		struct: structure/pub-structs/(struct-name)
		unless struct/empty? [
			vars/NAME: lowercase to string! struct-name
			template-generate tpl "OBJ" delimiters vars
	
			if struct/default? [
				template-generate  tpl  rejoin [vars/NAME "_OBJ_DEFAULT"]  delimiters  vars
			]
	
			foreach field-name sort keys-of struct/string-fields [
				vars/FIELDNAME: field-name
				vars/FIELDNAME_DASH: replace to string! field-name #"_" #"-"
				template-generate  tpl  rejoin [vars/NAME "_FIELD_STRING"]  delimiters  vars
			]

			foreach method-name sort keys-of struct/methods [
				method: struct/methods/(method-name)
				vars/METHODNAME: method-name

				template-generate  tpl  rejoin [vars/NAME "_METHOD"]  delimiters  vars
				if method/self [
					template-generate  tpl  probe rejoin [vars/NAME "_" vars/METHODNAME "_SELF"]  delimiters  vars
				]
				
				params: method/params
				foreach param-name keys-of params [
					vars/PARAMNAME: param-name
					vars/PARAMTYPE: params/(param-name)
					template-generate  tpl  rejoin [vars/NAME "_" vars/METHODNAME "_PARAM"]  delimiters  vars
				]
			]
		]
	]
	clean-tpl tpl delimiters
]


parse-template: function [
	tpl-path [file!]
	generator [function!]
	delimiters [block!]
] [
	tpl: read tpl-path

	template-generate tpl "TPL_COMMENT" delimiters make map! reduce ['TEMPLATE_FILE tpl-path]

	generator tpl delimiters

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


parse-template %sn_ffi/src/lib.tpl.rs :generate-rust ["/*" "*/"]
parse-template %sn-ffi.tpl.red :generate-red ["comment {" "}"]
copy-file %sn_ffi/Cargo.toml
