REDIS_VERSION="7.2.1"
REDIS_SHA256SUM="67866151542e2019b37d6dc2099e4268314a4f6a13c0c2acaf4407010eee2dc9"

getpkg https://github.com/redis/redis/archive/${REDIS_VERSION}.tar.gz $REDIS_SHA256SUM
tar zxf ${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
$PMAKE
make install PREFIX=$VENV
