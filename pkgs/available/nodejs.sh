NODEJS_VERSION="0.10.40"

getpkg http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz
tar zxvf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install
