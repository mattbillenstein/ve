PYPY_VERSION="5.0.0"
PYPY_ARCH="linux64"

if [ "$MOS" == "OSX" ]; then
PYPY_ARCH="osx64"
fi

if [ "$MOS" != "Arch" ]; then
getpkg https://bitbucket.org/pypy/pypy/downloads/pypy-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2
tar jxf pypy-${PYPY_VERSION}-${PYPY_ARCH}.tar.bz2
mv pypy-${PYPY_VERSION}-${PYPY_ARCH} $VENV/pypy

getpkg https://bootstrap.pypa.io/get-pip.py
$VENV/pypy/bin/pypy ./get-pip.py
fi
