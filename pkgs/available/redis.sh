# redis
REDIS_VERSION="3.0.7"
getpkg http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz
tar zxf redis-${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
$PMAKE
make install PREFIX=$VENV
