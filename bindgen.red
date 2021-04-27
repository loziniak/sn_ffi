Red [
	Name: {FFI interface and Red bindings generator for Safe Network}
]

api-root: %../github/sn_api/sn_api


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

scan-mod: function [
	code [string!]
	code-dir [file!]
	/local next-code next-dir
] [
	mods: copy []

	mod-declare: [
		"mod " copy mod any letter ";" (append mods mod) thru newline
	]

	declared-mod-pub: [
		"pub use " copy mod any letter "::" (
			if find mods mod [
				set [next-code next-dir] read-mod-code rejoin [code-dir mod]
				scan-mod next-code next-dir		;-- recursion
			]
		)
	]

	new-mod-pub: [
		"pub mod " copy mod any letter [
			";" (
				set [next-code next-dir] read-mod-code rejoin [code-dir mod]
				scan-mod next-code next-dir		;-- recursion
			)
			| " " blk (
				probe rejoin [":" mod]
				scan-mod inside code-dir		;-- recursion
			)
		]
	]

	tostring-field: [
		"pub " copy name any letter ": " copy type any letter "," newline
	]

	pub-struct: [
		"pub struct " copy name any letter " " blk (
			st-name: name
			struct: make map! compose/only [
				empty?: true
				tostring-fields: (make map! [])
			]
			parse inside [any [thru tostring-field (
				if find tostring-types type [
					extend struct/tostring-fields reduce [to word! name  type]
					struct/empty?: false
				]
			)]]

			unless struct/empty? [
				extend structure/pub-structs reduce [
					to word! st-name
					struct
				]
			]
		)
	]

	parse code [
		any thru [mod-declare | declared-mod-pub | new-mod-pub | pub-struct] thru newline
	]


;	print []
]


whitespace: charset reduce [space tab cr lf]
letter: charset [#"A" - #"Z" #"a" - #"z" #"_"]

;blk: [thru "{" copy inside [thru blk to "}"] "}" | ""]
not-blk-delim: charset [not #"}" #"{"]
blk: [any not-blk-delim ["{" copy inside any blk "}" | ""]]

tostring-types: ["String" | "XorUrlBase" | "XorUrl"]


structure: make map! compose [
	pub-structs: (make map! [])
]


set [lib-code lib-dir] read-mod-code rejoin [dirize api-root  %src/lib.rs]
scan-mod lib-code lib-dir

probe structure
