use std::os::raw::c_char;
use std::ffi::{CString, CStr};
use sn_api::{BootstrapConfig, Safe};



#[no_mangle]
pub extern "C" fn _safe_default() -> *mut Safe {
    let _safe: Safe = Safe::default();
    let _safe_box: Box<Safe> = Box::new(_safe);
    Box::into_raw(_safe_box)
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
    let _safe = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let xorurl_base = CString::new(_safe.xorurl_base.to_string()).expect("Could not convert to CString");
    xorurl_base.into_raw()
}

#[no_mangle]
pub extern "C" _safe_connect(ptr: *const Safe, bootstrap_contact: *const c_char) {
    assert!(!ptr.is_null());
    let _safe = unsafe {
        &*ptr
    };

    let bootstrap_contact = unsafe {
        CStr::from_ptr(bootstrap_contact)
    }

    let mut bootstrap_contacts = BootstrapConfig::default();
    bootstrap_contacts.insert(bootstrap_contact.parse().expect("Invalid bootstrap address"));

    // how to deal with async "connect" function?
    _safe.connect(None, None, Some(bootstrap_contacts)).await.expect("Connection error");
}

#[no_mangle]
pub extern "C" fn cstring_free(ptr: *mut c_char) {
    if ptr.is_null() {
        return;
    }
    unsafe {
        CString::from_raw(ptr);
    }
}
