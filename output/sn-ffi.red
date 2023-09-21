Red [
	 "This file is generated by %bindgen.red from %sn-ffi.tpl.red" 
]

#system [
	#import [

		"sn_ffi/target/i686-unknown-linux-gnu/debug/libsn_ffi.so" cdecl [
		


	

	

	
			c_client_create_register: "_client_create_register" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_client_get_chunk: "_client_get_chunk" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_client_get_network_concurrency_permit: "_client_get_network_concurrency_permit" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_client_get_register: "_client_get_register" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_client_get_signed_register_from_network: "_client_get_signed_register_from_network" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_client_new: "_client_new" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	



	

	

	
			c_clienteventsreceiver_recv: "_clienteventsreceiver_recv" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	



	

	

	
			c_clientregister_create_online: "_clientregister_create_online" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_clientregister_create_public_online: "_clientregister_create_public_online" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_clientregister_push: "_clientregister_push" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_clientregister_sync: "_clientregister_sync" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_clientregister_write_atop_online: "_clientregister_write_atop_online" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_clientregister_write_merging_branches_online: "_clientregister_write_merging_branches_online" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_clientregister_write_online: "_clientregister_write_online" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	



	

	

	
			c_files_pay_for_chunks: "_files_pay_for_chunks" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_files_read_bytes: "_files_read_bytes" [
				rt [handle!]
				ref [handle!]
				params [byte-ptr!]
				params_size [integer!]
			]
	
			c_files_read_from: "_files_read_from" [
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










client_create_register: function [
	ref [handle!]
    meta			;; in rust: XorName
    wallet_client			;; in rust: &mut WalletClient
    verify_store			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ meta  wallet_client  verify_store ]
		'redbin

	probe length? params
	r_client_create_register
		ref
		probe params
]

r_client_create_register: routine [
	ref [handle!]
	params [binary!]
] [
	c_client_create_register
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


client_get_chunk: function [
	ref [handle!]
    address			;; in rust: ChunkAddress
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ address ]
		'redbin

	probe length? params
	r_client_get_chunk
		ref
		probe params
]

r_client_get_chunk: routine [
	ref [handle!]
	params [binary!]
] [
	c_client_get_chunk
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


client_get_network_concurrency_permit: function [
	ref [handle!]
    
] [
	params: to binary! ""
	save/as
		params
		reduce []
		'redbin

	probe length? params
	r_client_get_network_concurrency_permit
		ref
		probe params
]

r_client_get_network_concurrency_permit: routine [
	ref [handle!]
	params [binary!]
] [
	c_client_get_network_concurrency_permit
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


client_get_register: function [
	ref [handle!]
    address			;; in rust: RegisterAddress
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ address ]
		'redbin

	probe length? params
	r_client_get_register
		ref
		probe params
]

r_client_get_register: routine [
	ref [handle!]
	params [binary!]
] [
	c_client_get_register
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


client_get_signed_register_from_network: function [
	ref [handle!]
    address			;; in rust: RegisterAddress
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ address ]
		'redbin

	probe length? params
	r_client_get_signed_register_from_network
		ref
		probe params
]

r_client_get_signed_register_from_network: routine [
	ref [handle!]
	params [binary!]
] [
	c_client_get_signed_register_from_network
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


client_new: function [
	ref [handle!]
    signer			;; in rust: SecretKey
    peers			;; in rust: Option<Vec<Multiaddr>>
    req_response_timeout			;; in rust: Option<Duration>
    custom_concurrency_limit			;; in rust: Option<usize>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ signer  peers  req_response_timeout  custom_concurrency_limit ]
		'redbin

	probe length? params
	r_client_new
		ref
		probe params
]

r_client_new: routine [
	ref [handle!]
	params [binary!]
] [
	c_client_new
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]











clienteventsreceiver_recv: function [
	ref [handle!]
    
] [
	params: to binary! ""
	save/as
		params
		reduce []
		'redbin

	probe length? params
	r_clienteventsreceiver_recv
		ref
		probe params
]

r_clienteventsreceiver_recv: routine [
	ref [handle!]
	params [binary!]
] [
	c_clienteventsreceiver_recv
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]











clientregister_create_online: function [
	ref [handle!]
    client			;; in rust: Client
    meta			;; in rust: XorName
    wallet_client			;; in rust: &mut WalletClient
    verify_store			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ client  meta  wallet_client  verify_store ]
		'redbin

	probe length? params
	r_clientregister_create_online
		ref
		probe params
]

r_clientregister_create_online: routine [
	ref [handle!]
	params [binary!]
] [
	c_clientregister_create_online
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


clientregister_create_public_online: function [
	ref [handle!]
    client			;; in rust: Client
    meta			;; in rust: XorName
    wallet_client			;; in rust: &mut WalletClient
    verify_store			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ client  meta  wallet_client  verify_store ]
		'redbin

	probe length? params
	r_clientregister_create_public_online
		ref
		probe params
]

r_clientregister_create_public_online: routine [
	ref [handle!]
	params [binary!]
] [
	c_clientregister_create_public_online
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


clientregister_push: function [
	ref [handle!]
    verify_store			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ verify_store ]
		'redbin

	probe length? params
	r_clientregister_push
		ref
		probe params
]

r_clientregister_push: routine [
	ref [handle!]
	params [binary!]
] [
	c_clientregister_push
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


clientregister_sync: function [
	ref [handle!]
    wallet_client			;; in rust: &mut WalletClient
    verify_store			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ wallet_client  verify_store ]
		'redbin

	probe length? params
	r_clientregister_sync
		ref
		probe params
]

r_clientregister_sync: routine [
	ref [handle!]
	params [binary!]
] [
	c_clientregister_sync
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


clientregister_write_atop_online: function [
	ref [handle!]
    entry			;; in rust: &[u8]
    children			;; in rust: BTreeSet<EntryHash>
    verify_store			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ entry  children  verify_store ]
		'redbin

	probe length? params
	r_clientregister_write_atop_online
		ref
		probe params
]

r_clientregister_write_atop_online: routine [
	ref [handle!]
	params [binary!]
] [
	c_clientregister_write_atop_online
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


clientregister_write_merging_branches_online: function [
	ref [handle!]
    entry			;; in rust: &[u8]
    verify_store			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ entry  verify_store ]
		'redbin

	probe length? params
	r_clientregister_write_merging_branches_online
		ref
		probe params
]

r_clientregister_write_merging_branches_online: routine [
	ref [handle!]
	params [binary!]
] [
	c_clientregister_write_merging_branches_online
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


clientregister_write_online: function [
	ref [handle!]
    entry			;; in rust: &[u8]
    verify_store			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ entry  verify_store ]
		'redbin

	probe length? params
	r_clientregister_write_online
		ref
		probe params
]

r_clientregister_write_online: routine [
	ref [handle!]
	params [binary!]
] [
	c_clientregister_write_online
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]











files_pay_for_chunks: function [
	ref [handle!]
    chunks			;; in rust: Vec<XorName>
    verify_store			;; in rust: bool
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ chunks  verify_store ]
		'redbin

	probe length? params
	r_files_pay_for_chunks
		ref
		probe params
]

r_files_pay_for_chunks: routine [
	ref [handle!]
	params [binary!]
] [
	c_files_pay_for_chunks
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


files_read_bytes: function [
	ref [handle!]
    address			;; in rust: ChunkAddress
    downloaded_file_path			;; in rust: Option<PathBuf>
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ address  downloaded_file_path ]
		'redbin

	probe length? params
	r_files_read_bytes
		ref
		probe params
]

r_files_read_bytes: routine [
	ref [handle!]
	params [binary!]
] [
	c_files_read_bytes
		tokio_runtime
		as handle! ref/value
		binary/rs-head params
		binary/rs-length? params
]


files_read_from: function [
	ref [handle!]
    address			;; in rust: ChunkAddress
    position			;; in rust: usize
    length			;; in rust: usize
    
] [
	params: to binary! ""
	save/as
		params
		reduce [ address  position  length ]
		'redbin

	probe length? params
	r_files_read_from
		ref
		probe params
]

r_files_read_from: routine [
	ref [handle!]
	params [binary!]
] [
	c_files_read_from
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



client!: object [
	ref: none

	

	
]

clienteventsreceiver!: object [
	ref: none

	

	
]

clientregister!: object [
	ref: none

	

	
]

files!: object [
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
