SQUID_VERSION="5.6"
SQUID_SHA256SUM="5d11091c9e772c24bcf65cc7b11111493f78406e283d7139f34d3a43db785c06"

getpkg http://www.squid-cache.org/Versions/v5/squid-${SQUID_VERSION}.tar.gz $SQUID_SHA256SUM
tar zxf squid-${SQUID_VERSION}.tar.gz
cd squid-${SQUID_VERSION}
./configure --prefix=$VENV --disable-auth --with-krb5-config=no --disable-external-acl-helpers --disable-eui --disable-arch-native --without-expat --without-libxml2 --without-gnutls --without-mit-krb5 --without-heimdal-krb5 --without-gnugss --without-netfilter-conntrack --without-libcap --without-nettle \
    --disable-strict-error-checking

$PMAKE
make install
