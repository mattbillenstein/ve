CURL_VERSION="7.67.0"
CURL_SHA256SUM="52af3361cf806330b88b4fe6f483b6844209d47ae196ac46da4de59bb361ab02"

rm -fR curl*
getpkg https://curl.haxx.se/download/curl-${CURL_VERSION}.tar.gz $CURL_SHA256SUM
tar zxf curl-${CURL_VERSION}.tar.gz
cd curl-${CURL_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
