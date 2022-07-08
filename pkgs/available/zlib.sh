ZLIB_VERSION="1.2.12"
ZLIB_SHA256SUM="91844808532e5ce316b3c010929493c0244f3d37593afd6de04f71821d5136d9"

rm -fR zlib*
getpkg https://www.zlib.net/zlib-${ZLIB_VERSION}.tar.gz $ZLIB_SHA256SUM
tar zxf zlib-${ZLIB_VERSION}.tar.gz
cd zlib-${ZLIB_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
