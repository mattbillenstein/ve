REDIS_VERSION="5.0.7"
REDIS_SHA256SUM="61db74eabf6801f057fd24b590232f2f337d422280fd19486eca03be87d3a82b"

getpkg http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz $REDIS_SHA256SUM
tar zxf redis-${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
$PMAKE
make install PREFIX=$VENV
