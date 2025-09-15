OPENSSL_VERSION="3.5.2"
OPENSSL_SHA256SUM="c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec"

rm -fR openssl*
getpkg https://github.com/openssl/openssl/releases/download/openssl-${OPENSSL_VERSION}/openssl-${OPENSSL_VERSION}.tar.gz $OPENSSL_SHA256SUM
tar zxf openssl-${OPENSSL_VERSION}.tar.gz
cd openssl-${OPENSSL_VERSION}

./Configure --prefix=$VENV -shared
$PMAKE
make install

# just put an empty file - gets replaced by cacert.sh
mkdir -p $VENV/ssl
touch $VENV/ssl/cert.pem
