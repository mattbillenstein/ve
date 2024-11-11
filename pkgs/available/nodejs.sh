NODEJS_VERSION="22.10.0"
NODEJS_SHA256SUM="42e4ab4ce34383488185cef6f06f8d1267bf91ebc5c6596fc3786efb0f8b5aaa"

getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz $NODEJS_SHA256SUM
tar zxf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install
