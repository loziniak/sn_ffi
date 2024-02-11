Red []

#include %output/sn-ffi.red

s: make safe! []
print s/init
; probe s/xorurl-base

probe s/connect
; 	127.0.0.1 12000
	["/ip4/127.0.0.1/tcp/35441/p2p/12D3KooWMNzC2ngpTL8itJ7LkaP1eHYxBkER6xvoAgLq9khNScHh"]
	"secret key hex should go here"

s/free
