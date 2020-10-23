MEMCACHED_VERSION="1.6.7"
MEMCACHED_SHA256SUM="7bbdac9b031d8cfca4a1207f28df598b90ee2e9b44667f7eabd0fe1a59ca5173"
getpkg http://www.memcached.org/files/memcached-${MEMCACHED_VERSION}.tar.gz $MEMCACHED_SHA256SUM
tar zxf memcached-${MEMCACHED_VERSION}.tar.gz
cd memcached-${MEMCACHED_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
