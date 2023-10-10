GETTEXT_VERSION="0.22.3"
GETTEXT_SHA256SUM="839a260b2314ba66274dae7d245ec19fce190a3aa67869bf31354cb558df42c7"

rm -fR gettext*
getpkg https://ftp.gnu.org/pub/gnu/gettext/gettext-${GETTEXT_VERSION}.tar.gz $GETTEXT_SHA256SUM
tar zxf gettext-${GETTEXT_VERSION}.tar.gz
cd gettext-${GETTEXT_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
