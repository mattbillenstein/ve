PYPY_VERSION="5.0.0"
PYPY_ARCH="linux64"

if [ "$MOS" == "OSX" ]; then
PYPY_ARCH="osx64"
fi

if [ "$MOS" != "Arch" ]; then
getpkg https://bitbucket.org/pypy/pypy/downloads/pypy-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2
tar jxf pypy-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2
mv pypy-${PYPY_VERSION}-${PYPY_ARCH} $VENV/pypy
else
# the official binaries are built on Ubuntu and OSX -- on other distros, build
# from source; it's best to actually install pypy on those platforms so the
# build doesn't take as long
rm -fR /tmp/usession-release-*
getpkg https://bitbucket.org/pypy/pypy/downloads/pypy-${PYPY_VERSION}-src.tar.bz2
tar jxf pypy-${PYPY_VERSION}-src.tar.bz2
cd pypy-${PYPY_VERSION}-src/pypy/goal
pypy ../../rpython/bin/rpython --opt=jit
PYTHONPATH=../.. ./pypy-c ../../pypy/tool/build_cffi_imports.py
cd ../tool/release
$VENV/bin/python ./package.py pypy-${PYPY_VERSION}-${PYPY_ARCH}
mv /tmp/usession-release-5.0-1/build/pypy-nightly $VENV/pypy
fi

cd $BUILD_DIR
getpkg https://bootstrap.pypa.io/get-pip.py
$VENV/pypy/bin/pypy ./get-pip.py
# upgrade pip
$VENV/bin/pip install --upgrade pip
