MEMCACHED_VERSION="1.6.21"
MEMCACHED_SHA256SUM="c788980efc417dd5d93c442b1c8b8769fb2018896c29de3887d22a2f143da2ee"
getpkg http://www.memcached.org/files/memcached-${MEMCACHED_VERSION}.tar.gz $MEMCACHED_SHA256SUM
tar zxf memcached-${MEMCACHED_VERSION}.tar.gz
cd memcached-${MEMCACHED_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
