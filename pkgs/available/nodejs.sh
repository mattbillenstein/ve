NODEJS_VERSION="8.9.4"

getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz
tar zxf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install
