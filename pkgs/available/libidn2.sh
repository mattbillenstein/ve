LIBIDN2_VERSION="2.3.4"
LIBIDN2_SHA256SUM="93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f"

rm -fR libidn2*
getpkg https://ftp.gnu.org/gnu/libidn/libidn2-${LIBIDN2_VERSION}.tar.gz $LIBIDN2_SHA256SUM
tar zxf libidn2-${LIBIDN2_VERSION}.tar.gz
cd libidn2-${LIBIDN2_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
