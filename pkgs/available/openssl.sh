OPENSSL_VERSION="1.0.2t"
OPENSSL_SHA256SUM="14cb464efe7ac6b54799b34456bd69558a749a4931ecfd9cf9f71d7881cac7bc"

rm -fR openssl*
getpkg https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz $OPENSSL_SHA256SUM
tar zxf openssl-${OPENSSL_VERSION}.tar.gz
cd openssl-${OPENSSL_VERSION}

OPTS="--prefix=$VENV -shared"
if [ "$MOS" == "MacOS" ]; then
OPTS="$OPTS darwin64-x86_64-cc"
else
OPTS="$OPTS linux-x86_64"
fi

./Configure $OPTS
$PMAKE
make install

# just put an empty file - gets replaced by cacert.sh
mkdir -p $VENV/ssl
touch $VENV/ssl/cert.pem
