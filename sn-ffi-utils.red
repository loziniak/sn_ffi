Red []

#include %longhex.red


u256-to-float: function [
	u256 [binary!]
	/decimal18
	return: [float!]
] [
	u256: longhex/trim u256
	expon: 0
; 	if decimal18 [
; 		set [u256 expon]
; 			longhex/div u256 #{0D E0 B6 B3 A7 64 00 00}
; 	]

	ret: 0.0
	radix: 1.0
	reverse u256
	foreach digit u256 [
		ret: ret + (radix * digit)
		radix: radix * 256.0
	]
	if decimal18 [ret: ret * 1e-18]
	ret * (256 ** expon)
]

context [
	rnd-xorname: function [
		return: [binary!]
	] [
		xorname: copy #{}
		loop 32 [
			append xorname (-1 + random/secure 256)
		]
	]

	set 'make-xorname function [
		sources [block!]
		return: [binary!]
	] [
		xorname: none
		names: copy []
		parse sources [
			['random (
				xorname: rnd-xorname
			)
			| 'from copy xorname binary! (
				xorname: first xorname
			)
			| 'from copy name string! (
				xorname: checksum  to binary! first name  'SHA256
			)]
			any [
				copy name string! (
					append names to binary! name
				)
				| copy name binary! (
					append names name
				)
			]
		]

		unless empty? names [ ; workaround
			forall names [
				xorname: xorname xor (first names)
			]
		]
		xorname
	]
]

bin-to-block: function [
	xorname [binary!]
	return: [block!]
] [
	ret: copy []
	forall xorname [
		append ret first xorname
	]
	ret
]

addr-to-bin: function [
	addr [string!]
	return: [binary!]
] [
	if "0x" = copy/part addr 2 [addr: skip addr 2]
	if (length? addr) % 2 = 1 [insert addr #"0"]
	debase/base addr 16
]
