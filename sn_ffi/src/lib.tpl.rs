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



/*bg:OBJ_DEFAULT [
    NAME: "Safe"
    LOWNAME: "s_afe"
]*/
#[no_mangle]
pub extern "C" fn s_afe_default() -> *mut Safe {
    Box::into_raw(Box::new(Safe::default()))
}

#[no_mangle]
pub extern "C" fn s_afe_free(ptr: *mut Safe) {
    if ptr.is_null() {
        return;
    }
    unsafe {
        Box::from_raw(ptr);
    }
}
/*bg-end:OBJ_DEFAULT*/


/*bg:FIELD_STRING [
    NAME: "Safe"
    LOWNAME: "s_afe"
    FIELDNAME: "xorurl_base"
]*/
#[no_mangle]
pub extern "C" fn s_afe_xorurl_base(ptr: *const Safe) -> *mut c_char {
    assert!(!ptr.is_null());
    let s_afe = unsafe {
        &*ptr
    };

    let xorurl_base = CString::new(s_afe.xorurl_base.to_string()).expect("Could not convert to CString");
    xorurl_base.into_raw()
}
/*bg-end:FIELD_STRING*/


/*bg:METHOD [
    NAME: "Safe"
    LOWNAME: "s_afe"
    METHODNAME: "connect"
]*/
#[no_mangle]
pub extern "C" fn s_afe_connect(rt_ptr: *mut Runtime, s_afe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("s_afe_connect pointer: {:?}, size: {:?}", params, params_size);

    assert!(!s_afe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("s_afe_connect u8: {:?}", params);

    let params: (
    /*bg:s_afe_connect_PARAM [
        PARAMNAME: "app_keypair"
        PARAMTYPE: "Option<Keypair>"
    ]*/
        Option<Keypair>, // app_keypair /*bg-end:s_afe_connect_PARAM*/
    ) = from_redbin(params).unwrap();
    println!("s_afe_connect params: {:?}", params);

    unsafe {
        let s_afe = &mut *s_afe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Safe::connect(/*bg:s_afe_connect_SELF []*/s_afe/*bg-end:s_afe_connect_SELF*//*bg:s_afe_connect_PARAM [PARAMNUM: "0" COMMA: ", " BORROW: "&"]*/, &params.0/*bg-end:s_afe_connect_PARAM*/));
    }
}
/*bg-end:METHOD*/

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
