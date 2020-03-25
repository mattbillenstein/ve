MEMCACHED_VERSION="1.5.20"
MEMCACHED_SHA256SUM="cfd7b023a9cefe7ae8a67184f51d841dbbf97994ed0e8a55e31ee092320ea1e4"
getpkg http://www.memcached.org/files/memcached-${MEMCACHED_VERSION}.tar.gz $MEMCACHED_SHA256SUM
tar zxf memcached-${MEMCACHED_VERSION}.tar.gz
cd memcached-${MEMCACHED_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
