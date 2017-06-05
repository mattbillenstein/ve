HAPROXY_VERSION="1.5.15"
#HAPROXY_VERSION="1.6.1"    # fairly unstable ATM

#getpkg http://www.haproxy.org/download/${HAPROXY_VERSION:0:3}/src/haproxy-${HAPROXY_VERSION}.tar.gz
getpkg https://vazor.com/drop/haproxy-${HAPROXY_VERSION}.tar.gz
tar zxf haproxy-${HAPROXY_VERSION}.tar.gz
cd haproxy-${HAPROXY_VERSION}

OPTS="USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 PREFIX= DESTDIR=$VENV"
if [ "$MOS" == "OSX" ]; then
OPTS="TARGET=osx USE_LIBCRYPT= SSL_INC=/usr/local/opt/openssl/include SSL_LIB=/usr/local/opt/openssl/lib $OPTS"
else
OPTS="TARGET=linux2628 $OPTS"
fi

$PMAKE $OPTS install
rm -f $VENV/sbin/haproxy-systemd-wrapper
