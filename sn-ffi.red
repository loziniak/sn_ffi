Red []

#system [
	#import [

		"sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		
			hello_world: "c_hello_world" [
				return: [c-string!]
			]

			xorurl_base: "c_xorurl_base" [
				return: [c-string!]
			]
		]
	]
	
	print [hello_world lf]

	print [xorurl_base lf]

]
