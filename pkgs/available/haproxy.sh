HAPROXY_VERSION="2.8.3"
HAPROXY_SHA256SUM="9ecc6ffe67a977d1ed279107bbdab790d73ae2a626bc38eee23fa1f6786a759e"

getpkg http://www.haproxy.org/download/${HAPROXY_VERSION:0:3}/src/haproxy-${HAPROXY_VERSION}.tar.gz $HAPROXY_SHA256SUM
tar zxf haproxy-${HAPROXY_VERSION}.tar.gz
cd haproxy-${HAPROXY_VERSION}

OPTS="USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 PREFIX= DESTDIR=$VENV"
if [ "$MOS" == "MacOS" ]; then
OPTS="TARGET=osx $OPTS"
else
OPTS="TARGET=linux-glibc $OPTS"
fi

$PMAKE $OPTS
$PMAKE $OPTS install
