MEMCACHED_VERSION="1.6.32"
MEMCACHED_SHA256SUM="4ab234219865191e8d1ba57a2f9167d8b573248fa4ff00b4d8296be13d24a82c"
getpkg http://www.memcached.org/files/memcached-${MEMCACHED_VERSION}.tar.gz $MEMCACHED_SHA256SUM
tar zxf memcached-${MEMCACHED_VERSION}.tar.gz
cd memcached-${MEMCACHED_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
