ZLIB_VERSION="1.3.1"
ZLIB_SHA256SUM="9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"

rm -fR zlib*
getpkg https://www.zlib.net/zlib-${ZLIB_VERSION}.tar.gz $ZLIB_SHA256SUM
tar zxf zlib-${ZLIB_VERSION}.tar.gz
cd zlib-${ZLIB_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
