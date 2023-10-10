ZLIB_VERSION="1.3"
ZLIB_SHA256SUM="ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f8bf355702efa593e"

rm -fR zlib*
getpkg https://www.zlib.net/zlib-${ZLIB_VERSION}.tar.gz $ZLIB_SHA256SUM
tar zxf zlib-${ZLIB_VERSION}.tar.gz
cd zlib-${ZLIB_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
