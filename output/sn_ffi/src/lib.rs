
//***
//* This file is generated by bindgen.red from sn_ffi/src/lib.tpl.rs
//*** 

use std::ffi::{CString, c_char};
use std::time::Duration;
use std::collections::BTreeSet;
use std::path::PathBuf;
use bytes::Bytes;
use tokio::runtime::Runtime;
use bls::SecretKey;
use libp2p::Multiaddr;
use xor_name::XorName;
use sn_registers::{RegisterAddress, EntryHash};
use sn_protocol::NetworkAddress;
use sn_protocol::storage::ChunkAddress;
use sn_transfers::{NanoTokens, MainPubkey, CashNote, UniquePubkey, client_transfers::{TransferOutputs, SpendRequest}};
use redbin::{de::from_bytes as from_redbin, ser::to_bytes as to_redbin};
use serde::Serialize;


use sn_client::Client;
use sn_client::ClientEventsReceiver;
use sn_client::ClientRegister;
use sn_client::Files;
use sn_client::WalletClient;


#[repr(C)]
pub struct Buffer {
	data: *mut u8,
	len: usize,
}

#[derive(Serialize)]
struct ErrorString(String, String);








#[no_mangle]
pub extern "C" fn client_create_register(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_create_register pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_create_register u8: {:?}", params);

    let params: (
    
        XorName, // meta 
        usize, // wallet_client 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("client_create_register params: {:?}", params);

    let ret = unsafe { // Result<ClientRegister, Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::create_register(client, params.0, &mut std::ptr::read(params.1 as *const WalletClient), params.2))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
    let ret: Result<usize, ErrorString> = ret.map(|value| Box::into_raw(Box::new(value)) as usize);
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_get_chunk(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_get_chunk pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_get_chunk u8: {:?}", params);

    let params: (
    
        ChunkAddress, // address 
    ) = from_redbin(params).unwrap();
    println!("client_get_chunk params: {:?}", params);

    let ret = unsafe { // Result<Chunk, Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::get_chunk(client, params.0))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_get_network_concurrency_permit(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_get_network_concurrency_permit pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_get_network_concurrency_permit u8: {:?}", params);

    let params: (
    
    ) = from_redbin(params).unwrap();
    println!("client_get_network_concurrency_permit params: {:?}", params);

    let ret = unsafe { // Result<OwnedSemaphorePermit, Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::get_network_concurrency_permit(client))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
    let ret: Result<usize, ErrorString> = ret.map(|value| Box::into_raw(Box::new(value)) as usize);
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_get_register(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_get_register pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_get_register u8: {:?}", params);

    let params: (
    
        RegisterAddress, // address 
    ) = from_redbin(params).unwrap();
    println!("client_get_register params: {:?}", params);

    let ret = unsafe { // Result<ClientRegister, Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::get_register(client, params.0))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
    let ret: Result<usize, ErrorString> = ret.map(|value| Box::into_raw(Box::new(value)) as usize);
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_get_signed_register_from_network(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_get_signed_register_from_network pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_get_signed_register_from_network u8: {:?}", params);

    let params: (
    
        RegisterAddress, // address 
    ) = from_redbin(params).unwrap();
    println!("client_get_signed_register_from_network params: {:?}", params);

    let ret = unsafe { // Result<SignedRegister, Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::get_signed_register_from_network(client, params.0))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_get_spend_from_network(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_get_spend_from_network pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_get_spend_from_network u8: {:?}", params);

    let params: (
    
        UniquePubkey, // unique_pubkey 
    ) = from_redbin(params).unwrap();
    println!("client_get_spend_from_network params: {:?}", params);

    let ret = unsafe { // Result<SignedSpend, Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::get_spend_from_network(client, &params.0))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_get_store_costs_at_address(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_get_store_costs_at_address pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_get_store_costs_at_address u8: {:?}", params);

    let params: (
    
        NetworkAddress, // address 
    ) = from_redbin(params).unwrap();
    println!("client_get_store_costs_at_address params: {:?}", params);

    let ret = unsafe { // Result<Vec<(MainPubkey, NanoTokens)>, Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::get_store_costs_at_address(client, &params.0))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_new(rt_ptr: *mut Runtime, params: *const u8, params_size: usize) -> Buffer {
    println!("client_new pointer: {:?}, size: {:?}", params, params_size);

    
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_new u8: {:?}", params);

    let params: (
    
        SecretKey, // signer 
        Option<Vec<Multiaddr>>, // peers 
        Option<Duration>, // req_response_timeout 
        Option<usize>, // custom_concurrency_limit 
    ) = from_redbin(params).unwrap();
    println!("client_new params: {:?}", params);

    let ret = unsafe { // Result<Client, Error>
        
        let rt = &mut *rt_ptr;
        rt.block_on(Client::new(params.0, params.1, params.2, params.3))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
    let ret: Result<usize, ErrorString> = ret.map(|value| Box::into_raw(Box::new(value)) as usize);
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_send(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_send pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_send u8: {:?}", params);

    let params: (
    
        BTreeSet<SpendRequest>, // spend_requests 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("client_send params: {:?}", params);

    let ret = unsafe { // Result<(), Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::send(client, &params.0, params.1))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_send_without_verify(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_send_without_verify pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_send_without_verify u8: {:?}", params);

    let params: (
    
        TransferOutputs, // transfer 
    ) = from_redbin(params).unwrap();
    println!("client_send_without_verify params: {:?}", params);

    let ret = unsafe { // Result<(), Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::send_without_verify(client, params.0))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn client_verify(rt_ptr: *mut Runtime, client_ptr: *mut Client, params: *const u8, params_size: usize) -> Buffer {
    println!("client_verify pointer: {:?}, size: {:?}", params, params_size);

    assert!(!client_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("client_verify u8: {:?}", params);

    let params: (
    
        CashNote, // cash_note 
    ) = from_redbin(params).unwrap();
    println!("client_verify params: {:?}", params);

    let ret = unsafe { // Result<(), Error>
        let client = &mut *client_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Client::verify(client, &params.0))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn clienteventsreceiver_recv(rt_ptr: *mut Runtime, clienteventsreceiver_ptr: *mut ClientEventsReceiver, params: *const u8, params_size: usize) -> Buffer {
    println!("clienteventsreceiver_recv pointer: {:?}, size: {:?}", params, params_size);

    assert!(!clienteventsreceiver_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("clienteventsreceiver_recv u8: {:?}", params);

    let params: (
    
    ) = from_redbin(params).unwrap();
    println!("clienteventsreceiver_recv params: {:?}", params);

    let ret = unsafe { // Result<ClientEvent, Error>
        let clienteventsreceiver = &mut *clienteventsreceiver_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(ClientEventsReceiver::recv(clienteventsreceiver))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn clientregister_create_online(rt_ptr: *mut Runtime, params: *const u8, params_size: usize) -> Buffer {
    println!("clientregister_create_online pointer: {:?}, size: {:?}", params, params_size);

    
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("clientregister_create_online u8: {:?}", params);

    let params: (
    
        usize, // client 
        XorName, // meta 
        usize, // wallet_client 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("clientregister_create_online params: {:?}", params);

    let ret = unsafe { // Result<ClientRegister, Error>
        
        let rt = &mut *rt_ptr;
        rt.block_on(ClientRegister::create_online(std::ptr::read(params.0 as *const Client), params.1, &mut std::ptr::read(params.2 as *const WalletClient), params.3))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
    let ret: Result<usize, ErrorString> = ret.map(|value| Box::into_raw(Box::new(value)) as usize);
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn clientregister_create_public_online(rt_ptr: *mut Runtime, params: *const u8, params_size: usize) -> Buffer {
    println!("clientregister_create_public_online pointer: {:?}, size: {:?}", params, params_size);

    
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("clientregister_create_public_online u8: {:?}", params);

    let params: (
    
        usize, // client 
        XorName, // meta 
        usize, // wallet_client 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("clientregister_create_public_online params: {:?}", params);

    let ret = unsafe { // Result<ClientRegister, Error>
        
        let rt = &mut *rt_ptr;
        rt.block_on(ClientRegister::create_public_online(std::ptr::read(params.0 as *const Client), params.1, &mut std::ptr::read(params.2 as *const WalletClient), params.3))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
    let ret: Result<usize, ErrorString> = ret.map(|value| Box::into_raw(Box::new(value)) as usize);
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn clientregister_push(rt_ptr: *mut Runtime, clientregister_ptr: *mut ClientRegister, params: *const u8, params_size: usize) -> Buffer {
    println!("clientregister_push pointer: {:?}, size: {:?}", params, params_size);

    assert!(!clientregister_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("clientregister_push u8: {:?}", params);

    let params: (
    
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("clientregister_push params: {:?}", params);

    let ret = unsafe { // Result<(), Error>
        let clientregister = &mut *clientregister_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(ClientRegister::push(clientregister, params.0))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn clientregister_sync(rt_ptr: *mut Runtime, clientregister_ptr: *mut ClientRegister, params: *const u8, params_size: usize) -> Buffer {
    println!("clientregister_sync pointer: {:?}, size: {:?}", params, params_size);

    assert!(!clientregister_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("clientregister_sync u8: {:?}", params);

    let params: (
    
        usize, // wallet_client 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("clientregister_sync params: {:?}", params);

    let ret = unsafe { // Result<(), Error>
        let clientregister = &mut *clientregister_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(ClientRegister::sync(clientregister, &mut std::ptr::read(params.0 as *const WalletClient), params.1))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn clientregister_write_atop_online(rt_ptr: *mut Runtime, clientregister_ptr: *mut ClientRegister, params: *const u8, params_size: usize) -> Buffer {
    println!("clientregister_write_atop_online pointer: {:?}, size: {:?}", params, params_size);

    assert!(!clientregister_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("clientregister_write_atop_online u8: {:?}", params);

    let params: (
    
        &[u8], // entry 
        BTreeSet<EntryHash>, // children 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("clientregister_write_atop_online params: {:?}", params);

    let ret = unsafe { // Result<(), Error>
        let clientregister = &mut *clientregister_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(ClientRegister::write_atop_online(clientregister, params.0, params.1, params.2))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn clientregister_write_merging_branches_online(rt_ptr: *mut Runtime, clientregister_ptr: *mut ClientRegister, params: *const u8, params_size: usize) -> Buffer {
    println!("clientregister_write_merging_branches_online pointer: {:?}, size: {:?}", params, params_size);

    assert!(!clientregister_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("clientregister_write_merging_branches_online u8: {:?}", params);

    let params: (
    
        &[u8], // entry 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("clientregister_write_merging_branches_online params: {:?}", params);

    let ret = unsafe { // Result<(), Error>
        let clientregister = &mut *clientregister_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(ClientRegister::write_merging_branches_online(clientregister, params.0, params.1))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn clientregister_write_online(rt_ptr: *mut Runtime, clientregister_ptr: *mut ClientRegister, params: *const u8, params_size: usize) -> Buffer {
    println!("clientregister_write_online pointer: {:?}, size: {:?}", params, params_size);

    assert!(!clientregister_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("clientregister_write_online u8: {:?}", params);

    let params: (
    
        &[u8], // entry 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("clientregister_write_online params: {:?}", params);

    let ret = unsafe { // Result<(), Error>
        let clientregister = &mut *clientregister_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(ClientRegister::write_online(clientregister, params.0, params.1))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn files_pay_for_chunks(rt_ptr: *mut Runtime, files_ptr: *mut Files, params: *const u8, params_size: usize) -> Buffer {
    println!("files_pay_for_chunks pointer: {:?}, size: {:?}", params, params_size);

    assert!(!files_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("files_pay_for_chunks u8: {:?}", params);

    let params: (
    
        Vec<XorName>, // chunks 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("files_pay_for_chunks params: {:?}", params);

    let ret = unsafe { // Result<(), Error>
        let files = &mut *files_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Files::pay_for_chunks(files, params.0, params.1))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn files_read_bytes(rt_ptr: *mut Runtime, files_ptr: *mut Files, params: *const u8, params_size: usize) -> Buffer {
    println!("files_read_bytes pointer: {:?}, size: {:?}", params, params_size);

    assert!(!files_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("files_read_bytes u8: {:?}", params);

    let params: (
    
        ChunkAddress, // address 
        Option<PathBuf>, // downloaded_file_path 
    ) = from_redbin(params).unwrap();
    println!("files_read_bytes params: {:?}", params);

    let ret = unsafe { // Result<Option<Bytes>, Error>
        let files = &mut *files_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Files::read_bytes(files, params.0, params.1))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn files_read_from(rt_ptr: *mut Runtime, files_ptr: *mut Files, params: *const u8, params_size: usize) -> Buffer {
    println!("files_read_from pointer: {:?}, size: {:?}", params, params_size);

    assert!(!files_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("files_read_from u8: {:?}", params);

    let params: (
    
        ChunkAddress, // address 
        usize, // position 
        usize, // length 
    ) = from_redbin(params).unwrap();
    println!("files_read_from params: {:?}", params);

    let ret = unsafe { // Result<Bytes, Error>
        let files = &mut *files_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Files::read_from(files, params.0, params.1, params.2))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn files_upload_with_payments(rt_ptr: *mut Runtime, files_ptr: *mut Files, params: *const u8, params_size: usize) -> Buffer {
    println!("files_upload_with_payments pointer: {:?}, size: {:?}", params, params_size);

    assert!(!files_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("files_upload_with_payments u8: {:?}", params);

    let params: (
    
        Bytes, // bytes 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("files_upload_with_payments params: {:?}", params);

    let ret = unsafe { // Result<NetworkAddress, Error>
        let files = &mut *files_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(Files::upload_with_payments(files, params.0, params.1))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn walletclient_get_store_cost_at_address(rt_ptr: *mut Runtime, walletclient_ptr: *mut WalletClient, params: *const u8, params_size: usize) -> Buffer {
    println!("walletclient_get_store_cost_at_address pointer: {:?}, size: {:?}", params, params_size);

    assert!(!walletclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("walletclient_get_store_cost_at_address u8: {:?}", params);

    let params: (
    
        NetworkAddress, // address 
    ) = from_redbin(params).unwrap();
    println!("walletclient_get_store_cost_at_address params: {:?}", params);

    let ret = unsafe { // Result<Vec<(MainPubkey, NanoTokens)>, Error>
        let walletclient = &mut *walletclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(WalletClient::get_store_cost_at_address(walletclient, &params.0))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
}

#[no_mangle]
pub extern "C" fn walletclient_send(rt_ptr: *mut Runtime, walletclient_ptr: *mut WalletClient, params: *const u8, params_size: usize) -> Buffer {
    println!("walletclient_send pointer: {:?}, size: {:?}", params, params_size);

    assert!(!walletclient_ptr.is_null());
    assert!(!rt_ptr.is_null());
    
    let params: &[u8] = unsafe { std::slice::from_raw_parts(params, params_size) };
    println!("walletclient_send u8: {:?}", params);

    let params: (
    
        NanoTokens, // amount 
        MainPubkey, // to 
        bool, // verify_store 
    ) = from_redbin(params).unwrap();
    println!("walletclient_send params: {:?}", params);

    let ret = unsafe { // Result<CashNote, Error>
        let walletclient = &mut *walletclient_ptr;
        let rt = &mut *rt_ptr;
        rt.block_on(WalletClient::send(walletclient, params.0, params.1, params.2))
    };
    let ret = ret.map_err(|err| ErrorString(format!("{:?}", err), format!("{}", err)));
    
	let mut ret_bytes: Vec<u8> = to_redbin(&ret).unwrap();
	let data = ret_bytes.as_mut_ptr();
	let len = ret_bytes.len();
	std::mem::forget(ret_bytes);
	return Buffer { data, len };
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

#[no_mangle]
pub extern "C" fn buffer_free(buf: Buffer) {
	let b: &mut [u8] = unsafe { std::slice::from_raw_parts_mut(buf.data, buf.len) };
	unsafe {
		Box::from_raw(b.as_mut_ptr());
	}
}
