cargo-bundle-licenses ^
  --format yaml ^
  --output %SRC_DIR%\THIRDPARTY.yml

REM maturin build --manifest-path python\Cargo.toml --release -i %PYTHON%

REM cd target\wheels
REM %PYTHON% -m pip install *.whl

pushd python
%PYTHON% -m pip install --no-deps --ignore-installed .
popd
