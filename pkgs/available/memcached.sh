MEMCACHED_VERSION="1.5.0"
getpkg http://www.memcached.org/files/memcached-${MEMCACHED_VERSION}.tar.gz
tar zxf memcached-${MEMCACHED_VERSION}.tar.gz
cd memcached-${MEMCACHED_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
