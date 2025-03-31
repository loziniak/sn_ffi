Red []

#include %longhex.red


u256-to-float: function [
	u256 [binary!]
	/decimal18
	return: [float!]
] [
	unless 32 = length? u256 [do make error! "u256 should be a 256-bit binary!"]
	u256: longhex/trim u256
	expon: 0
	if decimal18 [
		set [u256 expon]
			longhex/div u256 #{0D E0 B6 B3 A7 64 00 00}
	]

	ret: 0.0
	radix: 1.0
	reverse u256
	foreach digit u256 [
		ret: ret + (radix * digit)
		radix: radix * 256.0
	]
	ret * (256 ** expon)
]
