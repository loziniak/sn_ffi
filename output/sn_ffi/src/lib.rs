use std::os::raw::c_char;
use std::ffi::CString;


use sn_api::AuthedApp;
use sn_api::SafeAuthdClient;
use sn_api::AuthdStatus;
use sn_api::req::AuthReq;
use sn_api::Safe;
use sn_api::wallet::WalletSpendableBalance;




#[no_mangle]
pub extern "C" fn vendor_default() -> *mut Safe {
    let vendor: Safe = Safe::default();
    let vendor_box: Box<Safe> = Box::new(vendor);
    Box::into_raw(vendor_box)
}

#[no_mangle]
pub extern "C" fn vendor_free(ptr: *mut Safe) {
    if ptr.is_null() {
        return;
    }
    unsafe {
        Box::from_raw(ptr);
    }
}




#[no_mangle]
pub extern "C" fn vendor_vendor(ptr: *const AuthedApp) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let vendor = CString::new(vendor.vendor.to_string()).expect("Could not convert to CString");
    vendor.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_name(ptr: *const AuthedApp) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let name = CString::new(vendor.name.to_string()).expect("Could not convert to CString");
    name.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_id(ptr: *const AuthedApp) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let id = CString::new(vendor.id.to_string()).expect("Could not convert to CString");
    id.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_authd_endpoint(ptr: *const SafeAuthdClient) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let authd_endpoint = CString::new(vendor.authd_endpoint.to_string()).expect("Could not convert to CString");
    authd_endpoint.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_authd_version(ptr: *const AuthdStatus) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let authd_version = CString::new(vendor.authd_version.to_string()).expect("Could not convert to CString");
    authd_version.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_app_vendor(ptr: *const AuthReq) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let app_vendor = CString::new(vendor.app_vendor.to_string()).expect("Could not convert to CString");
    app_vendor.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_app_name(ptr: *const AuthReq) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let app_name = CString::new(vendor.app_name.to_string()).expect("Could not convert to CString");
    app_name.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_app_id(ptr: *const AuthReq) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let app_id = CString::new(vendor.app_id.to_string()).expect("Could not convert to CString");
    app_id.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_xorurl_base(ptr: *const Safe) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let xorurl_base = CString::new(vendor.xorurl_base.to_string()).expect("Could not convert to CString");
    xorurl_base.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_sk(ptr: *const WalletSpendableBalance) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let sk = CString::new(vendor.sk.to_string()).expect("Could not convert to CString");
    sk.into_raw()
}

#[no_mangle]
pub extern "C" fn vendor_xorurl(ptr: *const WalletSpendableBalance) -> *mut c_char {
    let vendor = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let xorurl = CString::new(vendor.xorurl.to_string()).expect("Could not convert to CString");
    xorurl.into_raw()
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
