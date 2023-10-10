NODEJS_VERSION="18.18.1"
NODEJS_SHA256SUM="f882080b1a5ee2fd5078521ec3016cb8472740d671d19465d377207d671af372"

getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz $NODEJS_SHA256SUM
tar zxf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install
