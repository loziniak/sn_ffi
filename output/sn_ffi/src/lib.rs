use std::os::raw::c_char;
use std::ffi::{CString, CStr};
use tokio::runtime::Runtime;
use redbin::{de::from_bytes as from_redbin, ser::to_bytes as to_redbin};
use bytes::Bytes;

use std::path::Path;
use std::time::Duration;
use std::{collections::BTreeSet, net::SocketAddr};

use sn_api::{NodeConfig, XorUrlBase, Keypair, BytesAddress, XorName, SafeUrl, VersionHash, ContentType, SafeAuthReqId, SecretKey,
    register::{EntryHash, Entry}, resolver::Range, multimap::MultimapKeyValue};


use sn_api::{AuthdStatus, AuthedApp, req::AuthReq, Safe, SafeAuthdClient, SafeAuthenticator};







#[no_mangle]
pub extern "C" fn authdstatus_authd_version(ptr: *const AuthdStatus) -> *mut c_char {
    assert!(!ptr.is_null());
    let authdstatus = unsafe {
        &*ptr
    };

    let authd_version = CString::new(authdstatus.authd_version.to_string()).expect("Could not convert to CString");
    authd_version.into_raw()
}

#[no_mangle]
pub extern "C" fn authedapp_id(ptr: *const AuthedApp) -> *mut c_char {
    assert!(!ptr.is_null());
    let authedapp = unsafe {
        &*ptr
    };

    let id = CString::new(authedapp.id.to_string()).expect("Could not convert to CString");
    id.into_raw()
}

#[no_mangle]
pub extern "C" fn authedapp_name(ptr: *const AuthedApp) -> *mut c_char {
    assert!(!ptr.is_null());
    let authedapp = unsafe {
        &*ptr
    };

    let name = CString::new(authedapp.name.to_string()).expect("Could not convert to CString");
    name.into_raw()
}

#[no_mangle]
pub extern "C" fn authedapp_vendor(ptr: *const AuthedApp) -> *mut c_char {
    assert!(!ptr.is_null());
    let authedapp = unsafe {
        &*ptr
    };

    let vendor = CString::new(authedapp.vendor.to_string()).expect("Could not convert to CString");
    vendor.into_raw()
}

#[no_mangle]
pub extern "C" fn authreq_app_id(ptr: *const AuthReq) -> *mut c_char {
    assert!(!ptr.is_null());
    let authreq = unsafe {
        &*ptr
    };

    let app_id = CString::new(authreq.app_id.to_string()).expect("Could not convert to CString");
    app_id.into_raw()
}

#[no_mangle]
pub extern "C" fn authreq_app_name(ptr: *const AuthReq) -> *mut c_char {
    assert!(!ptr.is_null());
    let authreq = unsafe {
        &*ptr
    };

    let app_name = CString::new(authreq.app_name.to_string()).expect("Could not convert to CString");
    app_name.into_raw()
}

#[no_mangle]
pub extern "C" fn authreq_app_vendor(ptr: *const AuthReq) -> *mut c_char {
    assert!(!ptr.is_null());
    let authreq = unsafe {
        &*ptr
    };

    let app_vendor = CString::new(authreq.app_vendor.to_string()).expect("Could not convert to CString");
    app_vendor.into_raw()
}

#[no_mangle]
pub extern "C" fn safe_xorurl_base(ptr: *const Safe) -> *mut c_char {
    assert!(!ptr.is_null());
    let safe = unsafe {
        &*ptr
    };

    let xorurl_base = CString::new(safe.xorurl_base.to_string()).expect("Could not convert to CString");
    xorurl_base.into_raw()
}

#[no_mangle]
pub extern "C" fn safeauthdclient_authd_endpoint(ptr: *const SafeAuthdClient) -> *mut c_char {
    assert!(!ptr.is_null());
    let safeauthdclient = unsafe {
        &*ptr
    };

    let authd_endpoint = CString::new(safeauthdclient.authd_endpoint.to_string()).expect("Could not convert to CString");
    authd_endpoint.into_raw()
}




#[no_mangle]
pub extern "C" fn safe_auth_app(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_auth_app pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_auth_app u8: {:?}", params);

    let params: (
    
        &str, // app_id 
        &str, // app_name 
        &str, // app_vendor 
        Option<&str>, // endpoint 
    ) = from_redbin(params).unwrap();
    println!("safe_auth_app params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::auth_app(params.0, params.1, params.2, params.3));
    }
}

#[no_mangle]
pub extern "C" fn safe_connect(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_connect pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_connect u8: {:?}", params);

    let params: (
    
        NodeConfig, // bootstrap_config 
        Option<Keypair>, // keypair 
        Option<&Path>, // config_path 
        Option<Duration>, // timeout 
    ) = from_redbin(params).unwrap();
    println!("safe_connect params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::connect(safe, params.0, params.1, params.2, params.3));
    }
}

#[no_mangle]
pub extern "C" fn safe_connected(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_connected pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_connected u8: {:?}", params);

    let params: (
    
        NodeConfig, // bootstrap_config 
        Option<Keypair>, // keypair 
        Option<&Path>, // config_path 
        Option<XorUrlBase>, // xorurl_base 
        Option<Duration>, // timeout 
    ) = from_redbin(params).unwrap();
    println!("safe_connected params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::connected(params.0, params.1, params.2, params.3, params.4));
    }
}

#[no_mangle]
pub extern "C" fn safe_fetch(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_fetch pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_fetch u8: {:?}", params);

    let params: (
    
        &str, // url 
        Range, // range 
    ) = from_redbin(params).unwrap();
    println!("safe_fetch params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::fetch(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_files_container_add(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_files_container_add pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_files_container_add u8: {:?}", params);

    let params: (
    
        &str, // source_file 
        &str, // url 
        bool, // force 
        bool, // update_nrs 
        bool, // follow_links 
    ) = from_redbin(params).unwrap();
    println!("safe_files_container_add params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::files_container_add(safe, params.0, params.1, params.2, params.3, params.4));
    }
}

#[no_mangle]
pub extern "C" fn safe_files_container_add_from_raw(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_files_container_add_from_raw pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_files_container_add_from_raw u8: {:?}", params);

    let params: (
    
        Bytes, // data 
        &str, // url 
        bool, // force 
        bool, // update_nrs 
    ) = from_redbin(params).unwrap();
    println!("safe_files_container_add_from_raw params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::files_container_add_from_raw(safe, params.0, params.1, params.2, params.3));
    }
}

#[no_mangle]
pub extern "C" fn safe_files_container_create(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_files_container_create pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_files_container_create u8: {:?}", params);

    let params: (
    
    ) = from_redbin(params).unwrap();
    println!("safe_files_container_create params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::files_container_create(safe));
    }
}

#[no_mangle]
pub extern "C" fn safe_files_container_get(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_files_container_get pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_files_container_get u8: {:?}", params);

    let params: (
    
        &str, // url 
    ) = from_redbin(params).unwrap();
    println!("safe_files_container_get params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::files_container_get(safe, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safe_files_container_remove_path(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_files_container_remove_path pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_files_container_remove_path u8: {:?}", params);

    let params: (
    
        &str, // url 
        bool, // recursive 
        bool, // update_nrs 
    ) = from_redbin(params).unwrap();
    println!("safe_files_container_remove_path params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::files_container_remove_path(safe, params.0, params.1, params.2));
    }
}

#[no_mangle]
pub extern "C" fn safe_files_get_public(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_files_get_public pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_files_get_public u8: {:?}", params);

    let params: (
    
        &str, // url 
        Range, // range 
    ) = from_redbin(params).unwrap();
    println!("safe_files_get_public params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::files_get_public(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_get_bytes(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_get_bytes pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_get_bytes u8: {:?}", params);

    let params: (
    
        BytesAddress, // address 
        Range, // range 
    ) = from_redbin(params).unwrap();
    println!("safe_get_bytes params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::get_bytes(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_inspect(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_inspect pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_inspect u8: {:?}", params);

    let params: (
    
        &str, // url 
    ) = from_redbin(params).unwrap();
    println!("safe_inspect params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::inspect(safe, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safe_multimap_create(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_multimap_create pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_multimap_create u8: {:?}", params);

    let params: (
    
        Option<XorName>, // name 
        u64, // type_tag 
        bool, // private 
    ) = from_redbin(params).unwrap();
    println!("safe_multimap_create params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::multimap_create(safe, params.0, params.1, params.2));
    }
}

#[no_mangle]
pub extern "C" fn safe_multimap_get_by_hash(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_multimap_get_by_hash pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_multimap_get_by_hash u8: {:?}", params);

    let params: (
    
        &str, // url 
        EntryHash, // hash 
    ) = from_redbin(params).unwrap();
    println!("safe_multimap_get_by_hash params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::multimap_get_by_hash(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_multimap_get_by_key(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_multimap_get_by_key pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_multimap_get_by_key u8: {:?}", params);

    let params: (
    
        &str, // url 
        &[u8], // key 
    ) = from_redbin(params).unwrap();
    println!("safe_multimap_get_by_key params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::multimap_get_by_key(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_multimap_insert(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_multimap_insert pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_multimap_insert u8: {:?}", params);

    let params: (
    
        &str, // multimap_url 
        MultimapKeyValue, // entry 
        BTreeSet<EntryHash>, // replace 
    ) = from_redbin(params).unwrap();
    println!("safe_multimap_insert params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::multimap_insert(safe, params.0, params.1, params.2));
    }
}

#[no_mangle]
pub extern "C" fn safe_multimap_remove(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_multimap_remove pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_multimap_remove u8: {:?}", params);

    let params: (
    
        &str, // url 
        BTreeSet<EntryHash>, // to_remove 
    ) = from_redbin(params).unwrap();
    println!("safe_multimap_remove params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::multimap_remove(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_nrs_add(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_nrs_add pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_nrs_add u8: {:?}", params);

    let params: (
    
        &str, // public_name 
        SafeUrl, // link 
    ) = from_redbin(params).unwrap();
    println!("safe_nrs_add params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::nrs_add(safe, params.0, &params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_nrs_associate(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_nrs_associate pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_nrs_associate u8: {:?}", params);

    let params: (
    
        &str, // public_name 
        SafeUrl, // link 
    ) = from_redbin(params).unwrap();
    println!("safe_nrs_associate params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::nrs_associate(safe, params.0, &params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_nrs_create(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_nrs_create pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_nrs_create u8: {:?}", params);

    let params: (
    
        &str, // top_name 
    ) = from_redbin(params).unwrap();
    println!("safe_nrs_create params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::nrs_create(safe, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safe_nrs_get(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_nrs_get pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_nrs_get u8: {:?}", params);

    let params: (
    
        &str, // public_name 
        Option<VersionHash>, // version 
    ) = from_redbin(params).unwrap();
    println!("safe_nrs_get params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::nrs_get(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_nrs_get_subnames_map(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_nrs_get_subnames_map pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_nrs_get_subnames_map u8: {:?}", params);

    let params: (
    
        &str, // public_name 
        Option<VersionHash>, // version 
    ) = from_redbin(params).unwrap();
    println!("safe_nrs_get_subnames_map params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::nrs_get_subnames_map(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_nrs_remove(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_nrs_remove pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_nrs_remove u8: {:?}", params);

    let params: (
    
        &str, // public_name 
    ) = from_redbin(params).unwrap();
    println!("safe_nrs_remove params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::nrs_remove(safe, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safe_parse_and_resolve_url(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_parse_and_resolve_url pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_parse_and_resolve_url u8: {:?}", params);

    let params: (
    
        &str, // url 
    ) = from_redbin(params).unwrap();
    println!("safe_parse_and_resolve_url params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::parse_and_resolve_url(safe, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safe_register_create(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_register_create pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_register_create u8: {:?}", params);

    let params: (
    
        Option<XorName>, // name 
        u64, // tag 
        bool, // private 
        ContentType, // content_type 
    ) = from_redbin(params).unwrap();
    println!("safe_register_create params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::register_create(safe, params.0, params.1, params.2, params.3));
    }
}

#[no_mangle]
pub extern "C" fn safe_register_read(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_register_read pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_register_read u8: {:?}", params);

    let params: (
    
        &str, // url 
    ) = from_redbin(params).unwrap();
    println!("safe_register_read params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::register_read(safe, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safe_register_read_entry(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_register_read_entry pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_register_read_entry u8: {:?}", params);

    let params: (
    
        &str, // url 
        EntryHash, // hash 
    ) = from_redbin(params).unwrap();
    println!("safe_register_read_entry params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::register_read_entry(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_register_write(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_register_write pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_register_write u8: {:?}", params);

    let params: (
    
        &str, // url 
        Entry, // entry 
        BTreeSet<EntryHash>, // parents 
    ) = from_redbin(params).unwrap();
    println!("safe_register_write params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::register_write(safe, params.0, params.1, params.2));
    }
}

#[no_mangle]
pub extern "C" fn safe_store_public_bytes(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_store_public_bytes pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_store_public_bytes u8: {:?}", params);

    let params: (
    
        Bytes, // bytes 
        Option<&str>, // media_type 
    ) = from_redbin(params).unwrap();
    println!("safe_store_public_bytes params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::store_public_bytes(safe, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safe_validate_sk_for_url(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("safe_validate_sk_for_url pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safe_validate_sk_for_url u8: {:?}", params);

    let params: (
    
        SecretKey, // secret_key 
        &str, // url 
    ) = from_redbin(params).unwrap();
    println!("safe_validate_sk_for_url params: {:?}", params);

    unsafe {
        let safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::validate_sk_for_url(safe, &params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_allow(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_allow pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_allow u8: {:?}", params);

    let params: (
    
        SafeAuthReqId, // req_id 
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_allow params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::allow(safeauthdclient, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_authed_apps(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_authed_apps pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_authed_apps u8: {:?}", params);

    let params: (
    
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_authed_apps params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::authed_apps(safeauthdclient));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_auth_reqs(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_auth_reqs pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_auth_reqs u8: {:?}", params);

    let params: (
    
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_auth_reqs params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::auth_reqs(safeauthdclient));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_create(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_create pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_create u8: {:?}", params);

    let params: (
    
        &str, // passphrase 
        &str, // password 
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_create params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::create(safeauthdclient, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_deny(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_deny pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_deny u8: {:?}", params);

    let params: (
    
        SafeAuthReqId, // req_id 
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_deny params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::deny(safeauthdclient, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_lock(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_lock pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_lock u8: {:?}", params);

    let params: (
    
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_lock params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::lock(safeauthdclient));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_revoke_app(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_revoke_app pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_revoke_app u8: {:?}", params);

    let params: (
    
        &str, // app_id 
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_revoke_app params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::revoke_app(safeauthdclient, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_status(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_status pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_status u8: {:?}", params);

    let params: (
    
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_status params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::status(safeauthdclient));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_subscribe_url(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_subscribe_url pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_subscribe_url u8: {:?}", params);

    let params: (
    
        &str, // endpoint_url 
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_subscribe_url params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::subscribe_url(safeauthdclient, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_unlock(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_unlock pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_unlock u8: {:?}", params);

    let params: (
    
        &str, // passphrase 
        &str, // password 
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_unlock params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::unlock(safeauthdclient, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safeauthdclient_unsubscribe(rt_ptr: *mut Runtime, safeauthdclient_ptr: *mut SafeAuthdClient, params: *const u8, params_size: usize) {
    println!("safeauthdclient_unsubscribe pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthdclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthdclient_unsubscribe u8: {:?}", params);

    let params: (
    
        &str, // endpoint_url 
    ) = from_redbin(params).unwrap();
    println!("safeauthdclient_unsubscribe params: {:?}", params);

    unsafe {
        let safeauthdclient = &mut *safeauthdclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthdClient::unsubscribe(safeauthdclient, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safeauthenticator_authenticate(rt_ptr: *mut Runtime, safeauthenticator_ptr: *mut SafeAuthenticator, params: *const u8, params_size: usize) {
    println!("safeauthenticator_authenticate pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthenticator_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthenticator_authenticate u8: {:?}", params);

    let params: (
    
        AuthReq, // _auth_req 
    ) = from_redbin(params).unwrap();
    println!("safeauthenticator_authenticate params: {:?}", params);

    unsafe {
        let safeauthenticator = &mut *safeauthenticator_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthenticator::authenticate(safeauthenticator, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safeauthenticator_authorise_app(rt_ptr: *mut Runtime, safeauthenticator_ptr: *mut SafeAuthenticator, params: *const u8, params_size: usize) {
    println!("safeauthenticator_authorise_app pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthenticator_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthenticator_authorise_app u8: {:?}", params);

    let params: (
    
        &str, // _req 
    ) = from_redbin(params).unwrap();
    println!("safeauthenticator_authorise_app params: {:?}", params);

    unsafe {
        let safeauthenticator = &mut *safeauthenticator_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthenticator::authorise_app(safeauthenticator, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safeauthenticator_create(rt_ptr: *mut Runtime, safeauthenticator_ptr: *mut SafeAuthenticator, params: *const u8, params_size: usize) {
    println!("safeauthenticator_create pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthenticator_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthenticator_create u8: {:?}", params);

    let params: (
    
        &str, // _passphrase 
        &str, // _password 
    ) = from_redbin(params).unwrap();
    println!("safeauthenticator_create params: {:?}", params);

    unsafe {
        let safeauthenticator = &mut *safeauthenticator_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthenticator::create(safeauthenticator, params.0, params.1));
    }
}

#[no_mangle]
pub extern "C" fn safeauthenticator_decode_req(rt_ptr: *mut Runtime, safeauthenticator_ptr: *mut SafeAuthenticator, params: *const u8, params_size: usize) {
    println!("safeauthenticator_decode_req pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthenticator_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthenticator_decode_req u8: {:?}", params);

    let params: (
    
        &str, // _req 
    ) = from_redbin(params).unwrap();
    println!("safeauthenticator_decode_req params: {:?}", params);

    unsafe {
        let safeauthenticator = &mut *safeauthenticator_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthenticator::decode_req(safeauthenticator, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safeauthenticator_revoke_app(rt_ptr: *mut Runtime, safeauthenticator_ptr: *mut SafeAuthenticator, params: *const u8, params_size: usize) {
    println!("safeauthenticator_revoke_app pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthenticator_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthenticator_revoke_app u8: {:?}", params);

    let params: (
    
        &str, // _y 
    ) = from_redbin(params).unwrap();
    println!("safeauthenticator_revoke_app params: {:?}", params);

    unsafe {
        let safeauthenticator = &mut *safeauthenticator_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthenticator::revoke_app(safeauthenticator, params.0));
    }
}

#[no_mangle]
pub extern "C" fn safeauthenticator_unlock(rt_ptr: *mut Runtime, safeauthenticator_ptr: *mut SafeAuthenticator, params: *const u8, params_size: usize) {
    println!("safeauthenticator_unlock pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safeauthenticator_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("safeauthenticator_unlock u8: {:?}", params);

    let params: (
    
        &str, // _passphrase 
        &str, // _password 
    ) = from_redbin(params).unwrap();
    println!("safeauthenticator_unlock params: {:?}", params);

    unsafe {
        let safeauthenticator = &mut *safeauthenticator_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(SafeAuthenticator::unlock(safeauthenticator, params.0, params.1));
    }
}


#[no_mangle]
pub extern "C" fn init_runtime() -> *mut Runtime {
    Box::into_raw(Box::new(Runtime::new().unwrap()))
}

#[no_mangle]
pub extern "C" fn cstring_free(cstring: *mut c_char) {
    if cstring.is_null() {
        return;
    }
    unsafe {
        CString::from_raw(cstring);
    }
}
