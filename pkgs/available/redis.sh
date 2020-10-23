REDIS_VERSION="6.0.8"
REDIS_SHA256SUM="04fa1fddc39bd1aecb6739dd5dd73858a3515b427acd1e2947a66dadce868d68"

getpkg http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz $REDIS_SHA256SUM
tar zxf redis-${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
$PMAKE
make install PREFIX=$VENV
