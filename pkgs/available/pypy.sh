PYPY_VERSION="4.0.1"
PYPY_ARCH="linux64"

if [ "$MOS" == "OSX" ]; then
PYPY_ARCH="osx64"
fi

getpkg https://bitbucket.org/pypy/pypy/downloads/pypy-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2
tar jxf pypy-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2
mv pypy-${PYPY_VERSION}-${PYPY_ARCH} $VENV/pypy

getpkg https://bootstrap.pypa.io/get-pip.py
$VENV/pypy/bin/pypy ./get-pip.py
