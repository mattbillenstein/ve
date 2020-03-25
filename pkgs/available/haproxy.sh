HAPROXY_VERSION="2.0.13"
HAPROXY_SHA256SUM="21f932ae18131ad58cb2f9d7cf2338349b6ccf3f5c33382624bbf1d3760b9be1"

getpkg http://www.haproxy.org/download/${HAPROXY_VERSION:0:3}/src/haproxy-${HAPROXY_VERSION}.tar.gz $HAPROXY_SHA256SUM
tar zxf haproxy-${HAPROXY_VERSION}.tar.gz
cd haproxy-${HAPROXY_VERSION}

OPTS="USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 PREFIX= DESTDIR=$VENV"
if [ "$MOS" == "MacOS" ]; then
OPTS="TARGET=osx USE_LIBCRYPT= SSL_INC=/usr/local/opt/openssl/include SSL_LIB=/usr/local/opt/openssl/lib $OPTS"
else
OPTS="TARGET=linux2628 $OPTS"
fi

$PMAKE $OPTS
$PMAKE $OPTS install
