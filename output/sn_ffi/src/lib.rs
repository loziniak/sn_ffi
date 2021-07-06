use std::os::raw::c_char;
use std::ffi::CString;


use sn_api::auth_types::AuthedApp;
use sn_api::SafeAuthdClient;
use sn_api::AuthdStatus;
use sn_api::req::AuthReq;
use sn_api::Safe;
use sn_api::wallet::WalletSpendableBalance;




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
pub extern "C" fn authedapp_vendor(ptr: *const AuthedApp) -> *mut c_char {
    let authedapp = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let vendor = CString::new(authedapp.vendor.to_string()).expect("Could not convert to CString");
    vendor.into_raw()
}

#[no_mangle]
pub extern "C" fn authedapp_name(ptr: *const AuthedApp) -> *mut c_char {
    let authedapp = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let name = CString::new(authedapp.name.to_string()).expect("Could not convert to CString");
    name.into_raw()
}

#[no_mangle]
pub extern "C" fn authedapp_id(ptr: *const AuthedApp) -> *mut c_char {
    let authedapp = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let id = CString::new(authedapp.id.to_string()).expect("Could not convert to CString");
    id.into_raw()
}

#[no_mangle]
pub extern "C" fn safeauthdclient_authd_endpoint(ptr: *const SafeAuthdClient) -> *mut c_char {
    let safeauthdclient = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let authd_endpoint = CString::new(safeauthdclient.authd_endpoint.to_string()).expect("Could not convert to CString");
    authd_endpoint.into_raw()
}

#[no_mangle]
pub extern "C" fn authdstatus_authd_version(ptr: *const AuthdStatus) -> *mut c_char {
    let authdstatus = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let authd_version = CString::new(authdstatus.authd_version.to_string()).expect("Could not convert to CString");
    authd_version.into_raw()
}

#[no_mangle]
pub extern "C" fn authreq_app_vendor(ptr: *const AuthReq) -> *mut c_char {
    let authreq = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let app_vendor = CString::new(authreq.app_vendor.to_string()).expect("Could not convert to CString");
    app_vendor.into_raw()
}

#[no_mangle]
pub extern "C" fn authreq_app_name(ptr: *const AuthReq) -> *mut c_char {
    let authreq = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let app_name = CString::new(authreq.app_name.to_string()).expect("Could not convert to CString");
    app_name.into_raw()
}

#[no_mangle]
pub extern "C" fn authreq_app_id(ptr: *const AuthReq) -> *mut c_char {
    let authreq = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let app_id = CString::new(authreq.app_id.to_string()).expect("Could not convert to CString");
    app_id.into_raw()
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
pub extern "C" fn walletspendablebalance_sk(ptr: *const WalletSpendableBalance) -> *mut c_char {
    let walletspendablebalance = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let sk = CString::new(walletspendablebalance.sk.to_string()).expect("Could not convert to CString");
    sk.into_raw()
}

#[no_mangle]
pub extern "C" fn walletspendablebalance_xorurl(ptr: *const WalletSpendableBalance) -> *mut c_char {
    let walletspendablebalance = unsafe {
        assert!(!ptr.is_null());
        &*ptr
    };

    let xorurl = CString::new(walletspendablebalance.xorurl.to_string()).expect("Could not convert to CString");
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
