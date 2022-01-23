Red []

#include %sn-ffi.red

s: make safe! []
print s/init
probe s/xorurl-base

s/connect 127.0.0.1 12000

s/free
