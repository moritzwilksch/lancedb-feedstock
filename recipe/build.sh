#!/bin/bash

set -ex
export OPENSSL_DIR=$PREFIX

# Bundle all library licenses
cargo-bundle-licenses \
  --format yaml \
  --output ${SRC_DIR}/THIRDPARTY.yml

maturin build --manifest-path python/Cargo.toml --release -i $PYTHON

cd target/wheels

# Install wheel manually
$PYTHON -m pip install *.whl
