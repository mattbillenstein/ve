NODEJS_VERSION="12.16.1"
NODEJS_SHA256SUM="a"

getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz $NODEJS_SHA256SUM
tar zxf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install
