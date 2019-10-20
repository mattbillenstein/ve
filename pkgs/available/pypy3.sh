PYPY_VERSION="v6.0.0"
PYPY_ARCH="linux64"

rm -fR $VENV/opt/pypy3
mkdir -p $VENV/opt

if [ "$MOS" == "MacOS" ]; then
PYPY_ARCH="osx64"
fi

if [ "$MOS" != "Arch" ]; then
getpkg https://bitbucket.org/pypy/pypy/downloads/pypy3-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2
tar jxf pypy3-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2
mv pypy3-${PYPY_VERSION}-${PYPY_ARCH} $VENV/opt/pypy3
else
# the official binaries are built on Ubuntu and MacOS -- on other distros, build
# from source; it's best to actually install pypy on those platforms so the
# build doesn't take as long
rm -fR /tmp/usession-release-*
getpkg https://bitbucket.org/pypy/pypy/downloads/pypy3-${PYPY_VERSION}-src.tar.bz2
tar jxf pypy3-${PYPY_VERSION}-src.tar.bz2
cd pypy3-${PYPY_VERSION}-src/pypy/goal
pypy ../../rpython/bin/rpython --opt=jit
PYTHONPATH=../.. ./pypy-c ../../pypy/tool/build_cffi_imports.py
cd ../tool/release
$VENV/bin/python ./package.py pypy3-${PYPY_VERSION}-${PYPY_ARCH}
mv /tmp/usession-release-6.0-1/build/pypy-nightly $VENV/opt/pypy3
fi

cd $BUILD_DIR
getpkg https://bootstrap.pypa.io/get-pip.py
$VENV/opt/pypy3/bin/pypy3 ./get-pip.py

$VENV/opt/pypy3/bin/pip install -r ${SCRIPTPATH}/pkgs/available/pypy3-requirements.txt --src $BUILD_DIR
