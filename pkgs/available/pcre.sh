PCRE_VERSION="8.45"
PCRE_SHA256SUM="4e6ce03e0336e8b4a3d6c2b70b1c5e18590a5673a98186da90d4f33c23defc09"

rm -fR pcre*
getpkg https://sourceforge.net/projects/pcre/files/pcre/$PCRE_VERSION/pcre-${PCRE_VERSION}.tar.gz/download $PCRE_SHA256SUM pcre-${PCRE_VERSION}.tar.gz
tar zxf pcre-${PCRE_VERSION}.tar.gz
cd pcre-${PCRE_VERSION}

./configure --prefix=$VENV --enable-utf
$PMAKE
make install
