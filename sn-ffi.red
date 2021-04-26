Red []

#system [
	#import [

		"sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		
			c_safe_default: "safe_default" [
				return: [handle!]
			]

			c_safe_free: "safe_free" [
				ref [handle!]
			]

			c_safe_xorurl_base: "safe_xorurl_base" [
				ref [handle!]
				return: [c-string!]
			]

			cstring_free: "cstring_free" [
				ptr [c-string!]
			]
		]
	]
	
]



; low-level routines

safe_default: routine [
	return: [handle!]
	/local ref
] [
	ref: handle/box as integer! c_safe_default
	as red-handle! SET_RETURN(ref)
]

safe_free: routine [
	ref [handle!]
] [
	c_safe_free as handle! ref/value
]

safe_xorurl_base: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_safe_xorurl_base as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]



; hi-level code

safe!: object [
	ref: none

	init: does [
		ref: safe_default
	]

	free: does [
		safe_free ref
		ref: none
	]

	xorurl-base: does [
		safe_xorurl_base ref
	]
]



; test

s: make safe! []
print s/init
probe s/xorurl-base
s/free
