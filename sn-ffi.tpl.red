Red []

#system [
	#import [

		"output/sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		
comment {bg:OBJ [
	NAME: "s-afe"
]}

	comment {bg:s-afe_OBJ_DEFAULT []}
			c_s-afe_default: "s-afe_default" [
				return: [handle!]
			]

			c_s-afe_free: "s-afe_free" [
				ref [handle!]
			]
	comment {bg-end:s-afe_OBJ_DEFAULT}

	comment {bg:s-afe_FIELD_STRING [
		FIELDNAME: "xorurl_base"
		FIELDNAME_DASH: "xorurl-base"
	]}
			c_s-afe_xorurl_base: "s-afe_xorurl_base" [
				ref [handle!]
				return: [c-string!]
			]
	comment {bg-end:s-afe_FIELD_STRING}

	comment {bg:s-afe_METHOD [
		METHODNAME: "c-onnect"
	]}
			c_s-afe_c-onnect: "_s-afe_c-onnect" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	comment {bg-end:s-afe_METHOD}

comment {bg-end:OBJ}

			init_runtime: "init_runtime" [
				return: [handle!]
			]

			cstring_free: "cstring_free" [
				ptr [c-string!]
			]
		]
	]
	
	tokio_runtime: init_runtime
]



; low-level routines

comment {bg:OBJ [
	NAME: "s-afe"
]}


comment {bg:s-afe_OBJ_DEFAULT []}
s-afe_default: routine [
	return: [handle!]
	/local ref
] [
	ref: handle/box as integer! c_s-afe_default
	as red-handle! SET_RETURN(ref)
]

s-afe_free: routine [
	ref [handle!]
] [
	c_s-afe_free as handle! ref/value
]
comment {bg-end:s-afe_OBJ_DEFAULT}

comment {bg:s-afe_FIELD_STRING [
	FIELDNAME: "xorurl_base"
	FIELDNAME_DASH: "xorurl-base"
]}
s-afe_xorurl_base: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_s-afe_xorurl_base as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]
comment {bg-end:s-afe_FIELD_STRING}

comment {bg:s-afe_METHOD [
	METHODNAME: "c-onnect"
]}

s-afe_c-onnect: function [
	ref [handle!]
    comment {bg:s-afe_c-onnect_PARAM [
        PARAMNAME: "app-keypair"
        PARAMTYPE: "Option<Keypair>"
    ]}app-keypair			;; in rust: Option<Keypair>
    comment {bg-end:s-afe_c-onnect_PARAM}
] [
	params: to binary! ""
	save/as
		params
		reduce [comment {bg:s-afe_c-onnect_PARAM [PARAMNAME: "app-keypair"]} app-keypair comment {bg-end:s-afe_c-onnect_PARAM}]
		'redbin

	probe length? params
	r_s-afe_c-onnect
		ref
		probe params
]

r_s-afe_c-onnect: routine [
	ref [handle!]
	params [binary!]
] [
	c_s-afe_c-onnect
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]
comment {bg-end:s-afe_METHOD}

comment {bg-end:OBJ}


; hi-level code

comment {bg:OBJ [
	NAME: "s-afe"
]}
s-afe!: object [
	ref: none

	comment {bg:s-afe_OBJ_DEFAULT []}
	init: does [
		ref: s-afe_default
	]

	free: does [
		s-afe_free ref
		ref: none
	]
	comment {bg-end:s-afe_OBJ_DEFAULT}

	comment {bg:s-afe_FIELD_STRING [
		FIELDNAME: "xorurl_base"
		FIELDNAME_DASH: "xorurl-base"
	]}
	xorurl-base: does [
		s-afe_xorurl_base ref
	]
	comment {bg-end:s-afe_FIELD_STRING}
]
comment {bg-end:OBJ}
