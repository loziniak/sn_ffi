use std::os::raw::c_char;
use std::ffi::{CString, CStr};
use sn_api::{Safe};
use tokio::runtime::Runtime;
use redbin::{de::from_bytes as from_redbin, ser::to_bytes as to_redbin};
use safe_network::types::Keypair;
use std::path::Path;
use std::{collections::BTreeSet, net::SocketAddr};


#[no_mangle]
pub extern "C" fn _safe_default() -> *mut Safe {
    Box::into_raw(Box::new(Safe::default()))
}

#[no_mangle]
pub extern "C" fn _safe_free(ptr: *mut Safe) {
    if ptr.is_null() {
        return;
    }
    unsafe {
        Box::from_raw(ptr);
    }
}

#[no_mangle]
pub extern "C" fn _safe_xorurl_base(ptr: *const Safe) -> *mut c_char {
    assert!(!ptr.is_null());
    let _safe = unsafe {
        &*ptr
    };

    let xorurl_base = CString::new(_safe.xorurl_base.to_string()).expect("Could not convert to CString");
    xorurl_base.into_raw()
}

#[no_mangle]
pub extern "C" fn _safe_connect(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, params: *const u8, params_size: usize) {
    println!("_safe_connect pointer: {:?}, size: {:?}", params, params_size);

    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("_safe_connect u8: {:?}", params);

    let params: (
        Option<Keypair>,
        Option<&Path>,
        (bls::PublicKey, BTreeSet<SocketAddr>)  // TODO: NodeConfig
    ) = from_redbin(params).unwrap();
    println!("_safe_connect params: {:?}", params);

    unsafe {
        let _safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(_safe.connect(params.0, params.1, params.2)).unwrap_or(());
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
