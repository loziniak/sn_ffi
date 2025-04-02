Red []

; recycle/off

#include %output/sn-ffi.red
#include %sn-ffi-utils.red

safe: make safe! []

probe safe/connect

; 	["/ip4/127.0.0.1/tcp/35441/p2p/12D3KooWMNzC2ngpTL8itJ7LkaP1eHYxBkER6xvoAgLq9khNScHh"]
	[]

; 	false
	true

; 	[87 169 17 205 67 20 92 190 47 255 180 185 171 163 172 106 90 98 133 171 224 45 25 115 136 176 146 99 2 226 138 1]
	bin-to-block #{57A911CD43145CBE2FFFB4B9ABA3AC6A5A6285ABE02D197388B0926302E28A01}

	"INFO"

print "^/^/^/"
safe/login-with-eth "ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"

print "^/^/^/Address"
print safe/address

print "^/^/^/Balance"
foreach bal safe/balance [print u256-to-float/decimal18 addr-to-bin bal]


print "^/^/^/Creating random reg ..."
xorname: make-xorname [random]
print ["^/^/^/Reg xorname:" xorname]
safe/reg-create
	#{0101010101}
	xorname
print "^/^/^/Reg created."

print "^/^/^/Balance"
foreach bal safe/balance [print u256-to-float/decimal18 addr-to-bin bal]

print ["^/^/Reading reg" xorname]
data: safe/read-reg
	xorname
	none						;-- version
print ["^/^/Reg data: " data]

print ["^/^/Updating reg" xorname]
safe/reg-write
	#{0102030405}
	xorname
print "^/^/^/Reg updated."
	
print "^/^/^/Balance"
foreach bal safe/balance [print u256-to-float/decimal18 addr-to-bin bal]

print ["^/^/Reading updated reg" xorname]
data: safe/read-reg
	xorname
	none						;-- version
print ["^/^/Reg data: " data]

print ["^/^/Reading updated reg v0"]
data: safe/read-reg
	xorname
	0							;-- version
print ["^/^/Reg v0 data: " data]


print ["^/^/Uploading data..."]
data-xorname: safe/upload
	#{090807060504030201}
print ["^/^/Uploaded."]
	
print "^/^/^/Balance"
foreach bal safe/balance [print u256-to-float/decimal18 addr-to-bin bal]

print ["^/^/Downloading data " data-xorname]
data: safe/download
	data-xorname
print ["^/^/Downloaded data: " data]


print "^/^/^/Free"
safe/free
