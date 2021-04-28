use std::os::raw::c_char;
use std::ffi::CString;
use sn_api::Safe;



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
pub extern "C" fn cstring_free(ptr: *mut c_char) {
    if ptr.is_null() {
        return;
    }
    unsafe {
        CString::from_raw(ptr);
    }
}
