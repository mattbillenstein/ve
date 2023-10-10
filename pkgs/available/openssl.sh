OPENSSL_VERSION="3.0.11"
OPENSSL_SHA256SUM="b3425d3bb4a2218d0697eb41f7fc0cdede016ed19ca49d168b78e8d947887f55"

rm -fR openssl*
getpkg https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz $OPENSSL_SHA256SUM
tar zxf openssl-${OPENSSL_VERSION}.tar.gz
cd openssl-${OPENSSL_VERSION}

OPTS="--prefix=$VENV -shared"
if [ "$MOS" == "MacOS" ]; then
  OPTS="$OPTS darwin64-${MARCH}-cc"
else
  OPTS="$OPTS linux-$(uname -m)"  # x86_64 / aarch64
fi

./Configure $OPTS
$PMAKE
make install

# just put an empty file - gets replaced by cacert.sh
mkdir -p $VENV/ssl
touch $VENV/ssl/cert.pem
