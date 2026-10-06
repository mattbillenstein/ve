NODEJS_VERSION="24.8.0"
NODEJS_SHA256SUM="6e9e8c931b5028a755e6c4e1edaf14296001ae8bbb35976a3896f59e7fd797c7"

getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz $NODEJS_SHA256SUM
tar zxf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install
