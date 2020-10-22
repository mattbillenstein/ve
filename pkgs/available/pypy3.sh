PYPY_VERSION="v7.3.2"
PYPY_SHA256SUM="a285ddcbc909d68c648585fae4f33b0ba24961bb4e8fafe5874cf725d6e83df6"
PYPY_ARCH="linux64"

rm -fR $VENV/opt/pypy3
mkdir -p $VENV/opt

if [ "$MOS" == "MacOS" ]; then
PYPY_ARCH="osx64"
PYPY_SHA256SUM="337dd4d9e529d2f221e0beb092236c18430e0564ab835c6bba425a1daf7c9958"
fi

if [ "$MOS" != "Arch" ]; then
getpkg https://downloads.python.org/pypy/pypy3.7-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2 $PYPY_SHA256SUM
tar jxf pypy3.7-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2
mv pypy3.7-${PYPY_VERSION}-${PYPY_ARCH} $VENV/opt/pypy3
else
# the official binaries are built on Ubuntu and MacOS -- on other distros, build
# from source; it's best to actually install pypy on those platforms so the
# build doesn't take as long
rm -fR /tmp/usession-release-*
PYPY_SHA256SUM=""
getpkg https://downloads.python.org/pypy/pypy3.7-${PYPY_VERSION}-src.tar.bz2 $PYPY_SHA256SUM
tar jxf pypy3.7-${PYPY_VERSION}-src.tar.bz2
cd pypy3.7-${PYPY_VERSION}-src/pypy/goal
pypy ../../rpython/bin/rpython --opt=jit
PYTHONPATH=../.. ./pypy-c ../../pypy/tool/build_cffi_imports.py
cd ../tool/release
$VENV/bin/python ./package.py pypy3.7-${PYPY_VERSION}-${PYPY_ARCH}
mv /tmp/usession-release-7.0-1/build/pypy-nightly $VENV/opt/pypy3
fi

cd $BUILD_DIR
curl -O https://bootstrap.pypa.io/get-pip.py
$VENV/opt/pypy3/bin/pypy3 ./get-pip.py

$VENV/opt/pypy3/bin/pip install -r ${SCRIPTPATH}/pkgs/available/pypy3-requirements.txt --src $BUILD_DIR
