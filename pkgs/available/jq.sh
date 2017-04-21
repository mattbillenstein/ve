JQ_VERSION="1.5"
getpkg https://github.com/stedolan/jq/archive/jq-${JQ_VERSION}.tar.gz
tar zxf jq-${JQ_VERSION}.tar.gz
cd jq-jq-${JQ_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
