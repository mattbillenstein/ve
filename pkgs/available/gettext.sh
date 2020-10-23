GETTEXT_VERSION="0.21"
GETTEXT_SHA256SUM="c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12"

rm -fR gettext*
getpkg https://ftp.gnu.org/pub/gnu/gettext/gettext-${GETTEXT_VERSION}.tar.gz $GETTEXT_SHA256SUM
tar zxvf gettext-${GETTEXT_VERSION}.tar.gz 
cd gettext-${GETTEXT_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
