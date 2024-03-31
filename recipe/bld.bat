cargo-bundle-licenses ^
  --format yaml ^
  --output %SRC_DIR%\THIRDPARTY.yml

maturin build --manifest-path python\Cargo.toml --release -i %PYTHON%

cd target\wheels
%PYTHON% -m pip install *.whl
