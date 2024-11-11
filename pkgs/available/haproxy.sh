HAPROXY_VERSION="2.8.11"
HAPROXY_SHA256SUM="39de529ae0283416acb5477197ece17ea05b81f467bec5a6ac73cbad7dd536a8"

getpkg http://www.haproxy.org/download/${HAPROXY_VERSION%.*}/src/haproxy-${HAPROXY_VERSION}.tar.gz $HAPROXY_SHA256SUM
tar zxf haproxy-${HAPROXY_VERSION}.tar.gz
cd haproxy-${HAPROXY_VERSION}

OPTS="USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 PREFIX= DESTDIR=$VENV"
if [ "$MOS" == "MacOS" ]; then
  OPTS="TARGET=osx $OPTS SSL_INC=$BREW_PREFIX/include SSL_LIB=$BREW_PREFIX/lib"
else
  OPTS="TARGET=linux-glibc $OPTS"
fi

$PMAKE $OPTS
$PMAKE $OPTS install
