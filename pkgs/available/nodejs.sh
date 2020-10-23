NODEJS_VERSION="12.19.0"
NODEJS_SHA256SUM="1279e49be60d92cf4c1a48c9d92397db4e9284a100bc47689ce7924686bbddd1"

getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz $NODEJS_SHA256SUM
tar zxf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install
