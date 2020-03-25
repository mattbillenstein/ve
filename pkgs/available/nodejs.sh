NODEJS_VERSION="12.16.1"
NODEJS_SHA256SUM="4fe8c3454f9bee5bbe72d44aa25cd931859b3037b7a9473081b3b2bd1b465b95"

getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz $NODEJS_SHA256SUM
tar zxf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install
