LIBUNISTRING_VERSION="0.9.10"
LIBUNISTRING_SHA256SUM="a82e5b333339a88ea4608e4635479a1cfb2e01aafb925e1290b65710d43f610b"

rm -fR libunistring*
getpkg https://ftp.gnu.org/gnu/libunistring/libunistring-${LIBUNISTRING_VERSION}.tar.gz $LIBUNISTRING_SHA256SUM
tar zxf libunistring-${LIBUNISTRING_VERSION}.tar.gz
cd libunistring-${LIBUNISTRING_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
