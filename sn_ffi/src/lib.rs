use std::os::raw::c_char;
use std::ffi::CString;
use sn_api::Safe;



fn xorurl_base() -> String {
    let mut safe = Safe::default();
    return safe.xorurl_base.to_string();
}

#[no_mangle]
pub extern "C" fn ffi_xorurl_base() -> *mut c_char {
    let rust_string: String = xorurl_base();

    // Convert the String into a CString
    let c_string: CString = CString::new(rust_string).expect("Could not convert to CString");

    // Instead of returning the CString, we return a pointer for it.
    return c_string.into_raw();
}

#[no_mangle]
pub extern "C" fn ffi_cstring_free(ptr: *mut c_char) {
    unsafe {
        if ptr.is_null() {
            // No data there, already freed probably.
            return;
        }

        // Here we reclaim ownership of the data the pointer points to, to free the memory properly.
        CString::from_raw(ptr);
    }
}
