Red []

#system [
	#import [

		"output/sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		


	
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
	



	

	



	

	
			c_authreq_app_id: "authreq_app_id" [
				ref [handle!]
				return: [c-string!]
			]
	
			c_authreq_app_name: "authreq_app_name" [
				ref [handle!]
				return: [c-string!]
			]
	
			c_authreq_app_vendor: "authreq_app_vendor" [
				ref [handle!]
				return: [c-string!]
			]
	



	

	
			c_authdstatus_authd_version: "authdstatus_authd_version" [
				ref [handle!]
				return: [c-string!]
			]
	



	

	
			c_safeauthdclient_authd_endpoint: "safeauthdclient_authd_endpoint" [
				ref [handle!]
				return: [c-string!]
			]
	



	

	



	

	
			c_authedapp_id: "authedapp_id" [
				ref [handle!]
				return: [c-string!]
			]
	
			c_authedapp_name: "authedapp_name" [
				ref [handle!]
				return: [c-string!]
			]
	
			c_authedapp_vendor: "authedapp_vendor" [
				ref [handle!]
				return: [c-string!]
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















authreq_app_id: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_authreq_app_id as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]

authreq_app_name: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_authreq_app_name as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]

authreq_app_vendor: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_authreq_app_vendor as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]








authdstatus_authd_version: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_authdstatus_authd_version as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]








safeauthdclient_authd_endpoint: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_safeauthdclient_authd_endpoint as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]















authedapp_id: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_authedapp_id as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]

authedapp_name: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_authedapp_name as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]

authedapp_vendor: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_authedapp_vendor as handle! ref/value

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

safeappclient!: object [
	ref: none

	

	
]

authreq!: object [
	ref: none

	

	
	app-id: does [
		authreq_app_id ref
	]
	
	app-name: does [
		authreq_app_name ref
	]
	
	app-vendor: does [
		authreq_app_vendor ref
	]
	
]

authdstatus!: object [
	ref: none

	

	
	authd-version: does [
		authdstatus_authd_version ref
	]
	
]

safeauthdclient!: object [
	ref: none

	

	
	authd-endpoint: does [
		safeauthdclient_authd_endpoint ref
	]
	
]

safeauthenticator!: object [
	ref: none

	

	
]

authedapp!: object [
	ref: none

	

	
	id: does [
		authedapp_id ref
	]
	
	name: does [
		authedapp_name ref
	]
	
	vendor: does [
		authedapp_vendor ref
	]
	
]

