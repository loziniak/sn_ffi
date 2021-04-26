use std::os::raw::c_char;
use std::ffi::CString;
use sn_api::Safe;



#[no_mangle]
pub extern "C" fn safe_default() -> *mut Safe {
    let safe: Safe = Safe::default();
    let safe_box: Box<Safe> = Box::new(safe);
    Box::into_raw(safe_box)
}

#[no_mangle]
pub extern "C" fn safe_free(ptr: *mut Safe) {
    if ptr.is_null() {
        return;
    }

    unsafe {
        Box::from_raw(ptr);
    }
}

#[no_mangle]
pub extern "C" fn safe_xorurl_base(ptr: *const Safe) -> *mut c_char {
    let safe = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let xorurl_base = CString::new(safe.xorurl_base.to_string()).expect("Could not convert to CString");
    xorurl_base.into_raw()
}


#[no_mangle]
pub extern "C" fn cstring_free(ptr: *mut c_char) {
    unsafe {
        if ptr.is_null() {
            // No data there, already freed probably.
            return;
        }

        // Here we reclaim ownership of the data the pointer points to, to free the memory properly.
        CString::from_raw(ptr);
    }
}
