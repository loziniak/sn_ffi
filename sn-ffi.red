Red []

#system [
	#import [

		"sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		
			c_safe_default: "_safe_default" [
				return: [handle!]
			]

			c_safe_free: "_safe_free" [
				ref [handle!]
			]

			c_safe_xorurl_base: "_safe_xorurl_base" [
				ref [handle!]
				return: [c-string!]
			]

			c_safe_connect: "_safe_connect" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]

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


safe_connect: function [
	ref [handle!]
	app-keypair			;;[paren! none!]
	config-path			;;[file! none!]
	bootstrap-config	;;[block!]
] [
	params: copy #{}
	save/as
		params
		reduce [app-keypair config-path bootstrap-config]
		'redbin

	probe length? params
	r_safe_connect
		ref
		probe params
]

r_safe_connect: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_connect
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]



; hi-level code

bls-key: function [
	key-bin [binary!]
	return: [block!]
] [
	key: copy []
	foreach b key-bin [
		append key b
	]
	reduce [key]
]


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

	connect: function [
		ip [tuple!]
		port [integer!]
	] [
		genesis-key: bls-key #{					
			8640 e62c c44e 75cf
			4fad c8ee 91b7 4b4c
			f0fd 2c09 84fb 0e3a
			b40f 0268 0685 7d8c
			41f0 1d37 2522 3c55
			b1ef 87d6 69f5 e2cc
		}

		safe_connect
			ref
			none ;app-keypair
			none ;config-path
			probe compose/deep [
				(genesis-key)
				[
					(rejoin [ip #":" port])
					(rejoin [ip #":" port + 1])		;-- NODES_TO_CONTACT_PER_STARTUP_BATCH = 3  @ safe_network/src/client/connections/messaging.rs
					(rejoin [ip #":" port + 2])
				]
			]
	]
]
