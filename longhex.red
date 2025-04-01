Red [
	description: "Long bi-hexadecimal (radix 256, byte is a digit) numbers crude math. Keeps float! precision even with very big/small numbers."
	see-also: "https://madformath.com/calculators/digital-systems/hexadecimal-arithmetic/hexadecimal-division-calculator-with-fractions/hexadecimal-division-calculator-with-fractions"
	author: loziniak
]

longhex: context [

	div: function [
		main
		by
	] [
		main: copy main
		ret: copy #{}
		ret-dec: 0

		a: copy #{}
		append a take main
		while [all [
			a <> #{00}
			7 > length? ret			;-- 52 bits of float! precision. 52 / 8 = 6.5 ~= 7 byte-digits
		]] [
		
			while [a lt by] [
				append a either tail? main [
					ret-dec: ret-dec - 1
					0
				] [
					take main
				]
			]

			times: 0
			until [
				last-a: a
				a: sub a by
; 				probe a: sub probe a probe by
; 				print ""
				unless empty? a [times: times + 1]
				empty? a			;-- sub zero
			]
			append ret times
; 			append ret probe times
; 			probe last-a
; 			print ""

			a: last-a
		]

		reduce [					;-- result = ret * (256 ^ (ret-dec * radix))
			trim ret
			ret-dec + length? main
		]
	]

	
	sub: function [a b] [
		a: copy a
		b: copy b
		if (length? a) < (length? b) [return copy #{}] ;-- less than 0

		ret: copy #{}
		borrowed?: no
		until [
			da: take/last a
			if borrowed? [da: da - 1]
			db: take/last b
			if none? db [db: 0]

			either da < db [
				either empty? a [
					return copy #{}		 ;-- less than 0
				] [
					da: 256 + da
					borrowed?: yes
				]
			] [
				borrowed?: no
			]

			insert ret (da - db)
			empty? a
		]

		trim ret
	]

	compare: function [a b] [
		if (length? a) < (length? b) [return -1]
		if (length? b) < (length? a) [return 1]
		forall a [
			unless a/1 = b/1 [return a/1 - b/1]
			b: next b
		]
		0
	]

	lt: make op! function [a b] [
		0 > compare a b
	]

	gt: make op! function [a b] [
		0 < compare a b
	]

	eq: make op! function [a b] [
		0 = compare a b
	]

	trim: function [a] [
		while [0 = first a] [
			if 1 = length? a [break]
			a: next a
		]
		a
	]
]
