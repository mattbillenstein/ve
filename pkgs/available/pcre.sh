PCRE_VERSION="8.43"
PCRE_SHA256SUM="0b8e7465dc5e98c757cc3650a20a7843ee4c3edf50aaf60bb33fd879690d2c73"

rm -fR pcre*
getpkg https://ftp.pcre.org/pub/pcre/pcre-${PCRE_VERSION}.tar.gz $PCRE_SHA256SUM
tar zxvf pcre-${PCRE_VERSION}.tar.gz 
cd pcre-${PCRE_VERSION}

./configure --prefix=$VENV --enable-utf
$PMAKE
make install
