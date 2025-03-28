Red []

#include %../red/red-scripts/testlib.red


test-init %sn-ffi-utils.red

test "u256-to-float" [
	expect 9450000000.0 [u256-to-float #{0000000000000000000000000000000000000000000000000000000233438E80}]
]

test-results/print
