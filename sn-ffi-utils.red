Red []

u256-to-float: function [
	u256 [binary!]
	return: [float!]
] [
	unless 32 = length? u256 [do make error! "u256 should be a 256-bit binary!"]
	u256: copy u256
	words: collect [
		loop 8 [
			keep take/last/part u256 4
		]
	]
	ret: 0.0
	radix: 1.0
	foreach word words [
		ret: ret + (radix * to integer! word)
		radix: radix * 4294967296.0
	]
	ret
]
