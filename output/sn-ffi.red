Red []

#system [
	#import [

		"sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		


	

	
			c_authedapp_vendor: "authedapp_vendor" [
				ref [handle!]
				return: [c-string!]
			]
	
			c_authedapp_name: "authedapp_name" [
				ref [handle!]
				return: [c-string!]
			]
	
			c_authedapp_id: "authedapp_id" [
				ref [handle!]
				return: [c-string!]
			]
	



	

	
			c_safeauthdclient_authd_endpoint: "safeauthdclient_authd_endpoint" [
				ref [handle!]
				return: [c-string!]
			]
	



	

	
			c_authdstatus_authd_version: "authdstatus_authd_version" [
				ref [handle!]
				return: [c-string!]
			]
	



	

	
			c_authreq_app_vendor: "authreq_app_vendor" [
				ref [handle!]
				return: [c-string!]
			]
	
			c_authreq_app_name: "authreq_app_name" [
				ref [handle!]
				return: [c-string!]
			]
	
			c_authreq_app_id: "authreq_app_id" [
				ref [handle!]
				return: [c-string!]
			]
	



	
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
	



	

	
			c_walletspendablebalance_sk: "walletspendablebalance_sk" [
				ref [handle!]
				return: [c-string!]
			]
	
			c_walletspendablebalance_xorurl: "walletspendablebalance_xorurl" [
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








walletspendablebalance_sk: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_walletspendablebalance_sk as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]

walletspendablebalance_xorurl: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_walletspendablebalance_xorurl as handle! ref/value

	size: length? str
	buffer: string/load str size UTF-8

	cstring_free str

	as red-string! SET_RETURN(buffer)
]





; hi-level code


authedapp!: object [
	ref: none

	

	
	vendor: does [
		authedapp_vendor ref
	]
	
	name: does [
		authedapp_name ref
	]
	
	id: does [
		authedapp_id ref
	]
	
]

safeauthdclient!: object [
	ref: none

	

	
	authd-endpoint: does [
		safeauthdclient_authd_endpoint ref
	]
	
]

authdstatus!: object [
	ref: none

	

	
	authd-version: does [
		authdstatus_authd_version ref
	]
	
]

authreq!: object [
	ref: none

	

	
	app-vendor: does [
		authreq_app_vendor ref
	]
	
	app-name: does [
		authreq_app_name ref
	]
	
	app-id: does [
		authreq_app_id ref
	]
	
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
	
]

walletspendablebalance!: object [
	ref: none

	

	
	sk: does [
		walletspendablebalance_sk ref
	]
	
	xorurl: does [
		walletspendablebalance_xorurl ref
	]
	
]




; test

s: make safe! []
print s/init
probe s/xorurl-base
s/free
