#!/bin/bash

set -ex

# Bundle all library licenses
cargo-bundle-licenses \
  --format yaml \
  --output ${SRC_DIR}/THIRDPARTY.yml

# Apply PEP517 to install the package

cd python/
maturin build --release -i $PYTHON

cd ../target/wheels

# Install wheel manually
$PYTHON -m pip install *.whl
