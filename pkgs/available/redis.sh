REDIS_VERSION="6.2.3"
REDIS_SHA256SUM="98ed7d532b5e9671f5df0825bb71f0f37483a16546364049384c63db8764512b"

getpkg http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz $REDIS_SHA256SUM
tar zxf redis-${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
$PMAKE
make install PREFIX=$VENV
