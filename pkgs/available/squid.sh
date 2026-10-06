SQUID_VERSION="7.7"
SQUID_SHA256SUM="5b05417d681c3cca275bc48ede12ee50a3e7d60cb47fb94522ee3a66022a8c59"

getpkg https://github.com/squid-cache/squid/releases/download/SQUID_${SQUID_VERSION/\./_}/squid-${SQUID_VERSION}.tar.gz $SQUID_SHA256SUM

tar zxf squid-${SQUID_VERSION}.tar.gz
cd squid-${SQUID_VERSION}
./configure --prefix=$VENV --disable-auth --with-krb5-config=no --disable-external-acl-helpers --disable-eui --disable-arch-native --without-expat --without-libxml2 --without-gnutls --without-mit-krb5 --without-heimdal-krb5 --without-gnugss --without-netfilter-conntrack --without-libcap --without-nettle \
    --disable-strict-error-checking

$PMAKE
make install
