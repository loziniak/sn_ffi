Red []

#system [
	#import [

;--		"sn_ffi/target/debug/libmy_library.so" cdecl [
		"sn_ffi/target/i686-unknown-linux-gnu/debug/libmy_library.so" cdecl [
		
			c_hello_world: "c_hello_world" [
		  		return: [c-string!]
			]
		]
	]
	
	print c_hello_world
]
