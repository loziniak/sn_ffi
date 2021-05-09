Red []

#system [
	#import [

		"output/sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		
comment {bg:OBJ [
	NAME: "s_afe"
]}

	comment {bg:s_afe_OBJ_DEFAULT []}
			c_s_afe_default: "s_afe_default" [
				return: [handle!]
			]

			c_s_afe_free: "s_afe_free" [
				ref [handle!]
			]
	comment {bg:s_afe_OBJ_DEFAULT}

	comment {bg:s_afe_FIELD_STRING [
		FIELDNAME: "xorurl_base"
		FIELDNAME_DASH: "xorurl-base"
	]}
			c_s_afe_xorurl_base: "s_afe_xorurl_base" [
				ref [handle!]
				return: [c-string!]
			]
	comment {bg:s_afe_FIELD_STRING}

comment {bg:OBJ}

			cstring_free: "cstring_free" [
				ptr [c-string!]
			]
		]
	]
	
]



; low-level routines

comment {bg:OBJ [
	NAME: "s_afe"
]}


comment {bg:s_afe_OBJ_DEFAULT []}
s_afe_default: routine [
	return: [handle!]
	/local ref
] [
	ref: handle/box as integer! c_s_afe_default
	as red-handle! SET_RETURN(ref)
]

s_afe_free: routine [
	ref [handle!]
] [
	c_s_afe_free as handle! ref/value
]
comment {bg:s_afe_OBJ_DEFAULT}

comment {bg:s_afe_FIELD_STRING [
	FIELDNAME: "xorurl_base"
	FIELDNAME_DASH: "xorurl-base"
]}
s_afe_xorurl_base: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_s_afe_xorurl_base as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]
comment {bg:s_afe_FIELD_STRING}

comment {bg:OBJ}


; hi-level code

comment {bg:OBJ [
	NAME: "s_afe"
]}
s_afe!: object [
	ref: none

	comment {bg:s_afe_OBJ_DEFAULT []}
	init: does [
		ref: s_afe_default
	]

	free: does [
		s_afe_free ref
		ref: none
	]
	comment {bg:s_afe_OBJ_DEFAULT}

	comment {bg:s_afe_FIELD_STRING [
		FIELDNAME: "xorurl_base"
		FIELDNAME_DASH: "xorurl-base"
	]}
	xorurl-base: does [
		s_afe_xorurl_base ref
	]
	comment {bg:s_afe_FIELD_STRING}
]
comment {bg:OBJ}
