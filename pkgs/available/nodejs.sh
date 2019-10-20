NODEJS_VERSION="10.16.3"
NODEJS_SHA256="db5a5e03a815b84a1266a4b48bb6a6d887175705f84fd2472f0d28e5e305a1f8"

getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz
tar zxf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install
