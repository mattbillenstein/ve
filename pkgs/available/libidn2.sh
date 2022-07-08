LIBIDN2_VERSION="2.3.0"
LIBIDN2_SHA256SUM="e1cb1db3d2e249a6a3eb6f0946777c2e892d5c5dc7bd91c74394fc3a01cab8b5"

rm -fR libidn2*
getpkg https://ftp.gnu.org/gnu/libidn/libidn2-${LIBIDN2_VERSION}.tar.gz $LIBIDN2_SHA256SUM
tar zxf libidn2-${LIBIDN2_VERSION}.tar.gz
cd libidn2-${LIBIDN2_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
