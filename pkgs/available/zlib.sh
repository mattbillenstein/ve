ZLIB_VERSION="1.2.13"
ZLIB_SHA256SUM="b3a24de97a8fdbc835b9833169501030b8977031bcb54b3b3ac13740f846ab30"

rm -fR zlib*
getpkg https://zlib.net/zlib-${ZLIB_VERSION}.tar.gz $ZLIB_SHA256SUM
tar zxf zlib-${ZLIB_VERSION}.tar.gz
cd zlib-${ZLIB_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
