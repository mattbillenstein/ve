LIBICONV_VERSION="1.16"
LIBICONV_SHA256SUM="e6a1b1b589654277ee790cce3734f07876ac4ccfaecbee8afa0b649cf529cc04"

rm -fR libiconv*
getpkg https://ftp.gnu.org/gnu/libiconv/libiconv-${LIBICONV_VERSION}.tar.gz $LIBICONV_SHA256SUM
tar zxf libiconv-${LIBICONV_VERSION}.tar.gz
cd libiconv-${LIBICONV_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
