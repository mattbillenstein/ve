REDIS_VERSION="7.0.2"
REDIS_SHA256SUM="5e57eafe7d4ac5ecb6a7d64d6b61db775616dbf903293b3fcc660716dbda5eeb"

getpkg http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz $REDIS_SHA256SUM
tar zxf redis-${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
$PMAKE
make install PREFIX=$VENV
