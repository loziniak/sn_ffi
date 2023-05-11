Red []

#system [
	#import [

		"sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		


	

	
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
	

	
			c_safe_auth_app: "_safe_auth_app" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_connect: "_safe_connect" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_connected: "_safe_connected" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_fetch: "_safe_fetch" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_files_container_add: "_safe_files_container_add" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_files_container_add_from_raw: "_safe_files_container_add_from_raw" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_files_container_create: "_safe_files_container_create" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_files_container_get: "_safe_files_container_get" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_files_container_remove_path: "_safe_files_container_remove_path" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_files_get_public: "_safe_files_get_public" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_get_bytes: "_safe_get_bytes" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_inspect: "_safe_inspect" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_multimap_create: "_safe_multimap_create" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_multimap_get_by_hash: "_safe_multimap_get_by_hash" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_multimap_get_by_key: "_safe_multimap_get_by_key" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_multimap_insert: "_safe_multimap_insert" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_multimap_remove: "_safe_multimap_remove" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_nrs_add: "_safe_nrs_add" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_nrs_associate: "_safe_nrs_associate" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_nrs_create: "_safe_nrs_create" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_nrs_get: "_safe_nrs_get" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_nrs_get_subnames_map: "_safe_nrs_get_subnames_map" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_nrs_remove: "_safe_nrs_remove" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_parse_and_resolve_url: "_safe_parse_and_resolve_url" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_register_create: "_safe_register_create" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_register_read: "_safe_register_read" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_register_read_entry: "_safe_register_read_entry" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_register_write: "_safe_register_write" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_store_public_bytes: "_safe_store_public_bytes" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safe_validate_sk_for_url: "_safe_validate_sk_for_url" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	



	

	
			c_safeauthdclient_authd_endpoint: "safeauthdclient_authd_endpoint" [
				ref [handle!]
				return: [c-string!]
			]
	

	
			c_safeauthdclient_allow: "_safeauthdclient_allow" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_authed_apps: "_safeauthdclient_authed_apps" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_auth_reqs: "_safeauthdclient_auth_reqs" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_create: "_safeauthdclient_create" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_deny: "_safeauthdclient_deny" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_lock: "_safeauthdclient_lock" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_revoke_app: "_safeauthdclient_revoke_app" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_status: "_safeauthdclient_status" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_subscribe_url: "_safeauthdclient_subscribe_url" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_unlock: "_safeauthdclient_unlock" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthdclient_unsubscribe: "_safeauthdclient_unsubscribe" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	



	

	

	
			c_safeauthenticator_authenticate: "_safeauthenticator_authenticate" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthenticator_authorise_app: "_safeauthenticator_authorise_app" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthenticator_create: "_safeauthenticator_create" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthenticator_decode_req: "_safeauthenticator_decode_req" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthenticator_revoke_app: "_safeauthenticator_revoke_app" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_safeauthenticator_unlock: "_safeauthenticator_unlock" [
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




safe_auth_app: function [
	ref [handle!]
    app_id			;; in rust: &str
    app_name			;; in rust: &str
    app_vendor			;; in rust: &str
    endpoint			;; in rust: Option<&str>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ app_id  app_name  app_vendor  endpoint ]
		'redbin

	probe length? params
	r_safe_auth_app
		ref
		probe params
]

r_safe_auth_app: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_auth_app
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_connect: function [
	ref [handle!]
    bootstrap_config			;; in rust: NodeConfig
    keypair			;; in rust: Option<Keypair>
    config_path			;; in rust: Option<&Path>
    timeout			;; in rust: Option<Duration>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ bootstrap_config  keypair  config_path  timeout ]
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


safe_connected: function [
	ref [handle!]
    bootstrap_config			;; in rust: NodeConfig
    keypair			;; in rust: Option<Keypair>
    config_path			;; in rust: Option<&Path>
    xorurl_base			;; in rust: Option<XorUrlBase>
    timeout			;; in rust: Option<Duration>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ bootstrap_config  keypair  config_path  xorurl_base  timeout ]
		'redbin

	probe length? params
	r_safe_connected
		ref
		probe params
]

r_safe_connected: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_connected
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_fetch: function [
	ref [handle!]
    url			;; in rust: &str
    range			;; in rust: Range
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url  range ]
		'redbin

	probe length? params
	r_safe_fetch
		ref
		probe params
]

r_safe_fetch: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_fetch
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_files_container_add: function [
	ref [handle!]
    source_file			;; in rust: &str
    url			;; in rust: &str
    force			;; in rust: bool
    update_nrs			;; in rust: bool
    follow_links			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ source_file  url  force  update_nrs  follow_links ]
		'redbin

	probe length? params
	r_safe_files_container_add
		ref
		probe params
]

r_safe_files_container_add: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_files_container_add
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_files_container_add_from_raw: function [
	ref [handle!]
    data			;; in rust: Bytes
    url			;; in rust: &str
    force			;; in rust: bool
    update_nrs			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ data  url  force  update_nrs ]
		'redbin

	probe length? params
	r_safe_files_container_add_from_raw
		ref
		probe params
]

r_safe_files_container_add_from_raw: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_files_container_add_from_raw
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_files_container_create: function [
	ref [handle!]
    
] [
	params: to binary! ""
	save/as
		params
		reduce []
		'redbin

	probe length? params
	r_safe_files_container_create
		ref
		probe params
]

r_safe_files_container_create: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_files_container_create
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_files_container_get: function [
	ref [handle!]
    url			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url ]
		'redbin

	probe length? params
	r_safe_files_container_get
		ref
		probe params
]

r_safe_files_container_get: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_files_container_get
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_files_container_remove_path: function [
	ref [handle!]
    url			;; in rust: &str
    recursive			;; in rust: bool
    update_nrs			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url  recursive  update_nrs ]
		'redbin

	probe length? params
	r_safe_files_container_remove_path
		ref
		probe params
]

r_safe_files_container_remove_path: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_files_container_remove_path
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_files_get_public: function [
	ref [handle!]
    url			;; in rust: &str
    range			;; in rust: Range
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url  range ]
		'redbin

	probe length? params
	r_safe_files_get_public
		ref
		probe params
]

r_safe_files_get_public: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_files_get_public
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_get_bytes: function [
	ref [handle!]
    address			;; in rust: BytesAddress
    range			;; in rust: Range
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ address  range ]
		'redbin

	probe length? params
	r_safe_get_bytes
		ref
		probe params
]

r_safe_get_bytes: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_get_bytes
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_inspect: function [
	ref [handle!]
    url			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url ]
		'redbin

	probe length? params
	r_safe_inspect
		ref
		probe params
]

r_safe_inspect: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_inspect
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_multimap_create: function [
	ref [handle!]
    name			;; in rust: Option<XorName>
    type_tag			;; in rust: u64
    private			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ name  type_tag  private ]
		'redbin

	probe length? params
	r_safe_multimap_create
		ref
		probe params
]

r_safe_multimap_create: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_multimap_create
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_multimap_get_by_hash: function [
	ref [handle!]
    url			;; in rust: &str
    hash			;; in rust: EntryHash
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url  hash ]
		'redbin

	probe length? params
	r_safe_multimap_get_by_hash
		ref
		probe params
]

r_safe_multimap_get_by_hash: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_multimap_get_by_hash
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_multimap_get_by_key: function [
	ref [handle!]
    url			;; in rust: &str
    key			;; in rust: &[u8]
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url  key ]
		'redbin

	probe length? params
	r_safe_multimap_get_by_key
		ref
		probe params
]

r_safe_multimap_get_by_key: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_multimap_get_by_key
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_multimap_insert: function [
	ref [handle!]
    multimap_url			;; in rust: &str
    entry			;; in rust: MultimapKeyValue
    replace			;; in rust: BTreeSet<EntryHash>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ multimap_url  entry  replace ]
		'redbin

	probe length? params
	r_safe_multimap_insert
		ref
		probe params
]

r_safe_multimap_insert: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_multimap_insert
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_multimap_remove: function [
	ref [handle!]
    url			;; in rust: &str
    to_remove			;; in rust: BTreeSet<EntryHash>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url  to_remove ]
		'redbin

	probe length? params
	r_safe_multimap_remove
		ref
		probe params
]

r_safe_multimap_remove: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_multimap_remove
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_nrs_add: function [
	ref [handle!]
    public_name			;; in rust: &str
    link			;; in rust: SafeUrl
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ public_name  link ]
		'redbin

	probe length? params
	r_safe_nrs_add
		ref
		probe params
]

r_safe_nrs_add: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_nrs_add
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_nrs_associate: function [
	ref [handle!]
    public_name			;; in rust: &str
    link			;; in rust: SafeUrl
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ public_name  link ]
		'redbin

	probe length? params
	r_safe_nrs_associate
		ref
		probe params
]

r_safe_nrs_associate: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_nrs_associate
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_nrs_create: function [
	ref [handle!]
    top_name			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ top_name ]
		'redbin

	probe length? params
	r_safe_nrs_create
		ref
		probe params
]

r_safe_nrs_create: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_nrs_create
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_nrs_get: function [
	ref [handle!]
    public_name			;; in rust: &str
    version			;; in rust: Option<VersionHash>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ public_name  version ]
		'redbin

	probe length? params
	r_safe_nrs_get
		ref
		probe params
]

r_safe_nrs_get: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_nrs_get
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_nrs_get_subnames_map: function [
	ref [handle!]
    public_name			;; in rust: &str
    version			;; in rust: Option<VersionHash>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ public_name  version ]
		'redbin

	probe length? params
	r_safe_nrs_get_subnames_map
		ref
		probe params
]

r_safe_nrs_get_subnames_map: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_nrs_get_subnames_map
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_nrs_remove: function [
	ref [handle!]
    public_name			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ public_name ]
		'redbin

	probe length? params
	r_safe_nrs_remove
		ref
		probe params
]

r_safe_nrs_remove: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_nrs_remove
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_parse_and_resolve_url: function [
	ref [handle!]
    url			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url ]
		'redbin

	probe length? params
	r_safe_parse_and_resolve_url
		ref
		probe params
]

r_safe_parse_and_resolve_url: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_parse_and_resolve_url
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_register_create: function [
	ref [handle!]
    name			;; in rust: Option<XorName>
    tag			;; in rust: u64
    private			;; in rust: bool
    content_type			;; in rust: ContentType
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ name  tag  private  content_type ]
		'redbin

	probe length? params
	r_safe_register_create
		ref
		probe params
]

r_safe_register_create: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_register_create
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_register_read: function [
	ref [handle!]
    url			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url ]
		'redbin

	probe length? params
	r_safe_register_read
		ref
		probe params
]

r_safe_register_read: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_register_read
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_register_read_entry: function [
	ref [handle!]
    url			;; in rust: &str
    hash			;; in rust: EntryHash
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url  hash ]
		'redbin

	probe length? params
	r_safe_register_read_entry
		ref
		probe params
]

r_safe_register_read_entry: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_register_read_entry
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_register_write: function [
	ref [handle!]
    url			;; in rust: &str
    entry			;; in rust: Entry
    parents			;; in rust: BTreeSet<EntryHash>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ url  entry  parents ]
		'redbin

	probe length? params
	r_safe_register_write
		ref
		probe params
]

r_safe_register_write: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_register_write
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_store_public_bytes: function [
	ref [handle!]
    bytes			;; in rust: Bytes
    media_type			;; in rust: Option<&str>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ bytes  media_type ]
		'redbin

	probe length? params
	r_safe_store_public_bytes
		ref
		probe params
]

r_safe_store_public_bytes: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_store_public_bytes
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safe_validate_sk_for_url: function [
	ref [handle!]
    secret_key			;; in rust: SecretKey
    url			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ secret_key  url ]
		'redbin

	probe length? params
	r_safe_validate_sk_for_url
		ref
		probe params
]

r_safe_validate_sk_for_url: routine [
	ref [handle!]
	params [binary!]
] [
	c_safe_validate_sk_for_url
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
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




safeauthdclient_allow: function [
	ref [handle!]
    req_id			;; in rust: SafeAuthReqId
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ req_id ]
		'redbin

	probe length? params
	r_safeauthdclient_allow
		ref
		probe params
]

r_safeauthdclient_allow: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_allow
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_authed_apps: function [
	ref [handle!]
    
] [
	params: to binary! ""
	save/as
		params
		reduce []
		'redbin

	probe length? params
	r_safeauthdclient_authed_apps
		ref
		probe params
]

r_safeauthdclient_authed_apps: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_authed_apps
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_auth_reqs: function [
	ref [handle!]
    
] [
	params: to binary! ""
	save/as
		params
		reduce []
		'redbin

	probe length? params
	r_safeauthdclient_auth_reqs
		ref
		probe params
]

r_safeauthdclient_auth_reqs: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_auth_reqs
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_create: function [
	ref [handle!]
    passphrase			;; in rust: &str
    password			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ passphrase  password ]
		'redbin

	probe length? params
	r_safeauthdclient_create
		ref
		probe params
]

r_safeauthdclient_create: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_create
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_deny: function [
	ref [handle!]
    req_id			;; in rust: SafeAuthReqId
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ req_id ]
		'redbin

	probe length? params
	r_safeauthdclient_deny
		ref
		probe params
]

r_safeauthdclient_deny: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_deny
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_lock: function [
	ref [handle!]
    
] [
	params: to binary! ""
	save/as
		params
		reduce []
		'redbin

	probe length? params
	r_safeauthdclient_lock
		ref
		probe params
]

r_safeauthdclient_lock: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_lock
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_revoke_app: function [
	ref [handle!]
    app_id			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ app_id ]
		'redbin

	probe length? params
	r_safeauthdclient_revoke_app
		ref
		probe params
]

r_safeauthdclient_revoke_app: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_revoke_app
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_status: function [
	ref [handle!]
    
] [
	params: to binary! ""
	save/as
		params
		reduce []
		'redbin

	probe length? params
	r_safeauthdclient_status
		ref
		probe params
]

r_safeauthdclient_status: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_status
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_subscribe_url: function [
	ref [handle!]
    endpoint_url			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ endpoint_url ]
		'redbin

	probe length? params
	r_safeauthdclient_subscribe_url
		ref
		probe params
]

r_safeauthdclient_subscribe_url: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_subscribe_url
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_unlock: function [
	ref [handle!]
    passphrase			;; in rust: &str
    password			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ passphrase  password ]
		'redbin

	probe length? params
	r_safeauthdclient_unlock
		ref
		probe params
]

r_safeauthdclient_unlock: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_unlock
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthdclient_unsubscribe: function [
	ref [handle!]
    endpoint_url			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ endpoint_url ]
		'redbin

	probe length? params
	r_safeauthdclient_unsubscribe
		ref
		probe params
]

r_safeauthdclient_unsubscribe: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthdclient_unsubscribe
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]











safeauthenticator_authenticate: function [
	ref [handle!]
    _auth_req			;; in rust: AuthReq
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ _auth_req ]
		'redbin

	probe length? params
	r_safeauthenticator_authenticate
		ref
		probe params
]

r_safeauthenticator_authenticate: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthenticator_authenticate
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthenticator_authorise_app: function [
	ref [handle!]
    _req			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ _req ]
		'redbin

	probe length? params
	r_safeauthenticator_authorise_app
		ref
		probe params
]

r_safeauthenticator_authorise_app: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthenticator_authorise_app
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthenticator_create: function [
	ref [handle!]
    _passphrase			;; in rust: &str
    _password			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ _passphrase  _password ]
		'redbin

	probe length? params
	r_safeauthenticator_create
		ref
		probe params
]

r_safeauthenticator_create: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthenticator_create
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthenticator_decode_req: function [
	ref [handle!]
    _req			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ _req ]
		'redbin

	probe length? params
	r_safeauthenticator_decode_req
		ref
		probe params
]

r_safeauthenticator_decode_req: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthenticator_decode_req
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthenticator_revoke_app: function [
	ref [handle!]
    _y			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ _y ]
		'redbin

	probe length? params
	r_safeauthenticator_revoke_app
		ref
		probe params
]

r_safeauthenticator_revoke_app: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthenticator_revoke_app
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


safeauthenticator_unlock: function [
	ref [handle!]
    _passphrase			;; in rust: &str
    _password			;; in rust: &str
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ _passphrase  _password ]
		'redbin

	probe length? params
	r_safeauthenticator_unlock
		ref
		probe params
]

r_safeauthenticator_unlock: routine [
	ref [handle!]
	params [binary!]
] [
	c_safeauthenticator_unlock
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


safe!: make safe! [

	init: does [
; 		ref: safe_default
		ref: none
	]

	free: does [
; 		safe_free ref
		ref: none
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
			compose/deep [ ;bootstrap_config
				(genesis-key)
				[
					(rejoin [ip #":" port])
					(rejoin [ip #":" port + 1])		;-- NODES_TO_CONTACT_PER_STARTUP_BATCH = 3  @ safe_network/src/client/connections/messaging.rs
					(rejoin [ip #":" port + 2])
				]
			]
			none ;keypair
			none ;config_path
			["secs" 10 "nanos" 0] ;timeout
	]
]
