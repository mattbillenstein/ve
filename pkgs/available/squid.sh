SQUID_VERSION="6.3"
SQUID_SHA256SUM="a4b6e081650f8724a6309e7f96a7decb42b334116d37e201d1caef91ff8259e2"

getpkg http://www.squid-cache.org/Versions/v${SQUID_VERSION%.*}/squid-${SQUID_VERSION}.tar.gz $SQUID_SHA256SUM
tar zxf squid-${SQUID_VERSION}.tar.gz
cd squid-${SQUID_VERSION}
./configure --prefix=$VENV --disable-auth --with-krb5-config=no --disable-external-acl-helpers --disable-eui --disable-arch-native --without-expat --without-libxml2 --without-gnutls --without-mit-krb5 --without-heimdal-krb5 --without-gnugss --without-netfilter-conntrack --without-libcap --without-nettle \
    --disable-strict-error-checking

$PMAKE
make install
