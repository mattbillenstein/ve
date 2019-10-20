# redis
REDIS_VERSION="5.0.5"
getpkg http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz
tar zxf redis-${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
$PMAKE
make install PREFIX=$VENV
