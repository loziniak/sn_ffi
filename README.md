
# sn_ffi

Safe Network *sn_api* bindings for Red language (32-bit).

## Building

```bash
git clone git@github.com:loziniak/sn_ffi.git

# rust 32-bit lib
cd sn_ffi/sn_ffi
cargo build --target=i686-unknown-linux-gnu

# red test
cd ..
red -c -o bin/sn-ffi sn-ffi.red
bin/sn-ffi
```
