Red [
	Name: {FFI interface and Red bindings generator for Safe Network}
]

api-root: %../github/sn_api/sn_api
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
probe mods-to-use: copy []

scan-mod: function [
	code [string!]
	code-dir [file!]
	/local next-code next-dir
	/extern mods-to-use
] [
	mods: copy []

	mod-declare: [
		"mod " copy mod some letter ";" (append mods mod) thru newline
	]

	declared-mod-pub: [
		"pub use "
		copy mod some letter "::"
		any [copy to-use-mod some letter "::" (append mods-to-use probe to-use-mod)]
		copy to-use-str to ";"
		(
			probe to-use-str

			if find mods mod [
				set [next-code next-dir] read-mod-code rejoin [code-dir mod]
				scan-mod next-code next-dir		;-- recursion
			]
		)
	]

	new-mod-pub: [
		"pub mod " copy mod some letter (
			either mod = first probe mods-to-use [
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
			]
			parse inside [any [thru string-field (
				if find string-types type [
					struct/string-fields/(to word! name): type
					struct/empty?: false
				]
			)]]

			unless struct/empty? [
				structure/pub-structs/(to word! st-name): struct
			]
		)
	]

	impl-default: [
		"impl Default for " copy name some letter " {" (
			structure/pub-structs/(to word! name)/default?: true
		)
	]

	parse code [
		any thru [mod-declare | declared-mod-pub | new-mod-pub | pub-struct | impl-default] thru newline
	]
]




structure: make map! compose [
	pub-structs: (make map! [])
]

set [lib-code lib-dir] read-mod-code rejoin [dirize api-root  %src/lib.rs]
scan-mod lib-code lib-dir



copy-file: function [
	source [file!]
	destination [file!]
] [
	print ["--------→" destination]
	write destination read source
]

copy-file %sn_ffi/Cargo.toml rejoin [output %/sn_ffi/Cargo.toml]

tpl: read tpl-path: %sn_ffi/src/lib.tpl.rs


replace-args: function [
	body [string!]
	args [string!]
] [
	foreach [n s] load args [
		replace/all/case  body  s  get to word! n
	]
]

template-rule: function [
	template-fragment [string!]
] [
	rule: reduce [rejoin ["/*bg:" template-fragment " "]]
	append rule [copy args ["[" thru "]"] "*/"

		copy body

		to ]
	append/dup  rule  rejoin ["/*bg:" template-fragment "*/"]  2
	append rule [
		(
			replace-args body args
		)
		insert body
	]
	rule
]

clean-tpl: function [
	tpl [string!]
] [
	parse tpl [any thru remove ["/*bg:" some letter " [" thru "]*/"
		thru
		["/*bg:" some letter "*/"]
	]]
	tpl
]




foreach struct-name keys-of structure/pub-structs [
	struct: structure/pub-structs/(struct-name)
	NAME: struct-name
	LOWNAME: lowercase to string! NAME

	MOD: copy ""
	foreach m struct/mod [
		append MOD to string! m
		append MOD "::"
	]

	parse tpl compose/only [any thru (template-rule "API_IMPORT")]

	if struct/default? [
		parse tpl compose/only [any thru (template-rule "OBJ_DEFAULT")]
	]

	foreach field-name keys-of struct/string-fields [
		FIELDNAME: field-name
		parse tpl compose/only [any thru (template-rule "FIELD_STRING")]
	]
]

output-file: rejoin [
	output
	"/"
	replace  copy tpl-path  ".tpl"  ""
]
print ["--------→" output-file]
write  output-file  clean-tpl tpl
