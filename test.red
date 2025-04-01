Red []

#include %testlib.red


print "longhex:"
test-init %longhex.red

test "trim" [
	expect #{02 71 30} [longhex/trim  #{00 02 71 30}]
	expect #{71 30} [longhex/trim  #{71 30}]
]

test "compare" [
	assert [0 = longhex/compare  #{23}  #{23}]
	assert [0 > longhex/compare  #{23}  #{01 23}]
	assert [0 < longhex/compare  #{01 23}  #{23}]
	assert [0 = longhex/compare  #{01 23}  #{01 23}]
	assert [0 < longhex/compare  #{01 24}  #{01 23}]
	assert [0 > longhex/compare  #{01 23}  #{01 24}]
]

test "sub" [
	expect #{} [longhex/sub  #{02}  #{07}]
	expect #{05} [longhex/sub  #{07}  #{02}]
	expect #{00} [longhex/sub  #{45}  #{45}]
	expect #{FF} [longhex/sub  #{01 00}  #{01}]
	expect #{FF FF} [longhex/sub  #{01 00 00}  #{01}]
	expect #{} [longhex/sub  #{01 00 00}  #{01 00 01}]
	expect #{FF FF EF} [longhex/sub  #{01 00 00 06}  #{17}]
]

test "div" [
	expect [#{05} 0] [longhex/div  #{23}  #{07}]
	expect [#{05} 0] [longhex/div  #{05}  #{01}]
	expect [#{05} -1] [longhex/div  #{05}  #{01 00}]
	expect [#{12 34} 0] [longhex/div  #{01 4B 5A 90}  #{12 34}]
	expect [#{016345785D8A} 0] [longhex/div  #{0D E0 B6 B3 A7 64}  #{0A}]
	expect [#{016345785D8A} 2] [longhex/div  #{0D E0 B6 B3 A7 64 00 00}  #{0A}]
	expect [#{28966287A88E25} -10] [longhex/div  #{02 33 43 8E 80}  #{0D E0 B6 B3 A7 64 00 00}]
]

test-results/print


print "^/utils:"
test-init %sn-ffi-utils.red

test "u256-to-float" [
	expect 9450000000.0 [u256-to-float
		#{0000000000000000000000000000000000000000000000000000000233438E80}]
	expect 0.00000000945 [u256-to-float/decimal18
		#{0000000000000000000000000000000000000000000000000000000233438E80}]
]

test "make-xorname" [
	x: make-xorname [random]
	x1: make-xorname reduce ['from x]
	assert [x = x1]
	
	x2: make-xorname reduce ['from x  "test"]
	assert [x1 <> x2]

	x3: make-xorname reduce ['from x1  to binary! "test"]
	assert [x2 = x3]
]

test "addr-to-bin" [
	expect #{12} [addr-to-bin "0x12"]
	expect #{12} [addr-to-bin "12"]
	expect #{01} [addr-to-bin "1"]
	expect #{} [addr-to-bin ""]
	expect #{02 1e 19 d9 dd c9 0a 0b 1b 8f} [addr-to-bin "0x21e19d9ddc90a0b1b8f"]
]

test-results/print
