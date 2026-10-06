REDIS_VERSION="8.10.2"
REDIS_SHA256SUM="541a374b753a8405683dd88560465791acc98cf09445ef10ec1bd286904273e8"

getpkg https://github.com/redis/redis/archive/refs/tags/${REDIS_VERSION}.tar.gz $REDIS_SHA256SUM
tar zxf ${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
$PMAKE
make install PREFIX=$VENV
