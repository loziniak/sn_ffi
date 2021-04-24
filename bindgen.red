Red [
	Name: {FFI interface and Red bindings generator for Safe Network}
]

api-root: %../github/sn_api/sn_api


clean: function [code [string!]] [
	ignored: [remove [newline | comment] | thru newline]
	parse code [any ignored]
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

	code: read probe code-file
	clean code

	reduce [code code-dir]
]

scan-mod: function [
	code [string!]
	code-dir [file!]
	/local next-code next-dir
] [
	mods: copy []
	parse code [
		any [
			thru "mod " copy mod any letter ";" (append mods mod) thru newline
		]
	]
;	probe mods

	parse code [
		any [
			thru "pub use " copy mod any letter "::" (
				if find mods mod [
					set [next-code next-dir] read-mod-code rejoin [code-dir mod]
					scan-mod next-code next-dir		;-- recursion
				]
			) thru newline
		]
	]

	parse code [
		any [
			thru "pub mod " copy mod any letter [
				";" (
					if find mods mod [
						set [next-code next-dir] read-mod-code rejoin [code-dir mod]
						scan-mod next-code next-dir		;-- recursion
					]
				) thru newline
				| " " blk (
					probe rejoin [":" mod]
					clean inside
					scan-mod inside code-dir
				) thru newline
			]
		]
	]

;	print []
]


comment: ["//" thru newline]
;whitespace: charset reduce [space tab cr lf]
letter: charset [#"A" - #"Z" #"a" - #"z" #"_"]

;blk: [thru "{" copy inside [thru blk to "}"] "}" | ""]
blk: [any other ["{" copy inside any blk "}" | ""]]



print "========================="
set [lib-code lib-dir] read-mod-code rejoin [dirize api-root  %src/lib.rs]
scan-mod lib-code lib-dir
