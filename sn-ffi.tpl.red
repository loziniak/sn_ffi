Red []

#system [
	#import [

		"sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [

comment ___________.LIBRARY-IMPORTS.___________

;			xorurl_base: "ffi_xorurl_base" [
;				return: [c-string!]
;			]

			cstring_free: "ffi_cstring_free" [
				ptr [c-string!]
			]
		]
	]
	
]


comment ___________.ROUTINES.___________

;xorurl-base: routine [
;	return: [string!]
;	/local str buffer size
;] [
;	str: xorurl_base
;
;	size: length? str
;	buffer: string/load str size UTF-8
;
;	cstring_free str
;
;	buffer
;]


print xorurl-base
