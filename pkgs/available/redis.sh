REDIS_VERSION="7.0.2"
REDIS_SHA256SUM="8f0f6a738281b995fd698095a18065fd3fde5ee55c3229498a669ab21bdaf9cc"

getpkg http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz $REDIS_SHA256SUM
tar zxf redis-${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
$PMAKE
make install PREFIX=$VENV
