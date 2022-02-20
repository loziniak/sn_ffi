Red []

#system [
	#import [

		"output/sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		


	

	
			c_authdstatus_authd_version: "authdstatus_authd_version" [
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
	



	

	
			c_safe_xorurl_base: "safe_xorurl_base" [
				ref [handle!]
				return: [c-string!]
			]
	



	

	
			c_safeauthdclient_authd_endpoint: "safeauthdclient_authd_endpoint" [
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












; hi-level code


authdstatus!: object [
	ref: none

	

	
	authd-version: does [
		authdstatus_authd_version ref
	]
	
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

safe!: object [
	ref: none

	

	
	xorurl-base: does [
		safe_xorurl_base ref
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

