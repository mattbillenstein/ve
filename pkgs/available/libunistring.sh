LIBUNISTRING_VERSION="1.1"
LIBUNISTRING_SHA256SUM="a2252beeec830ac444b9f68d6b38ad883db19919db35b52222cf827c385bdb6a"

rm -fR libunistring*
getpkg https://ftp.gnu.org/gnu/libunistring/libunistring-${LIBUNISTRING_VERSION}.tar.gz $LIBUNISTRING_SHA256SUM
tar zxf libunistring-${LIBUNISTRING_VERSION}.tar.gz
cd libunistring-${LIBUNISTRING_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
