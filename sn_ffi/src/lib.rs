use std::os::raw::c_char;
use std::ffi::{CString, CStr};
use sn_api::{BootstrapConfig, Safe};
use tokio::runtime::Runtime;



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
pub extern "C" fn _safe_connect(rt_ptr: *mut Runtime, safe_ptr: *mut Safe, bootstrap_contact: *const c_char) {
    assert!(!safe_ptr.is_null());
    assert!(!rt_ptr.is_null());

    let bootstrap_contact_str = unsafe {
        CStr::from_ptr(bootstrap_contact).to_str().unwrap()
    };

    println!("_safe_connect: {:?}", bootstrap_contact_str);
    let mut bootstrap_contacts = BootstrapConfig::default();
    bootstrap_contacts.insert(bootstrap_contact_str.parse().expect("Invalid bootstrap address"));

    unsafe {
        let _safe = &mut *safe_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(_safe.connect(None, None, Some(bootstrap_contacts))).unwrap_or(());
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
