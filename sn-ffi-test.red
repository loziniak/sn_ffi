Red []

#include %output/sn-ffi.red

safe: make safe! []

probe safe/connect

; 	["/ip4/127.0.0.1/tcp/35441/p2p/12D3KooWMNzC2ngpTL8itJ7LkaP1eHYxBkER6xvoAgLq9khNScHh"]
	[]

; 	false
	true

	[87 169 17 205 67 20 92 190 47 255 180 185 171 163 172 106 90 98 133 171 224 45 25 115 136 176 146 99 2 226 138 1]

	"INFO"

print "^/^/^/"

safe/login-with-eth "ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"

safe/free
