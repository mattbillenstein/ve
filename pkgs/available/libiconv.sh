LIBICONV_VERSION="1.17"
LIBICONV_SHA256SUM="8f74213b56238c85a50a5329f77e06198771e70dd9a739779f4c02f65d971313"

rm -fR libiconv*
getpkg https://ftp.gnu.org/gnu/libiconv/libiconv-${LIBICONV_VERSION}.tar.gz $LIBICONV_SHA256SUM
tar zxf libiconv-${LIBICONV_VERSION}.tar.gz
cd libiconv-${LIBICONV_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
