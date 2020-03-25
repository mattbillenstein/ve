ZLIB_VERSION="1.2.11"
ZLIB_SHA256SUM="c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1"

rm -fR zlib*
getpkg https://www.zlib.net/zlib-${ZLIB_VERSION}.tar.gz $ZLIB_SHA256SUM
tar zxvf zlib-${ZLIB_VERSION}.tar.gz 
cd zlib-${ZLIB_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
