
# sn_ffi

Safe Network *sn_api* bindings for Red language (32-bit).

## Building

```bash
git clone git@github.com:loziniak/sn_ffi.git

# generate sources
./red-08may23-652d66a4f bindgen.red

# rust 32-bit lib
cd output/sn_ffi
cargo build --target=i686-unknown-linux-gnu

# red test
cd ../..
./red-toolchain-08may23-652d66a4f -c -o bin/sn-ffi-test sn-ffi-test.red
bin/sn-ffi-test
```
