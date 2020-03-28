SQUID_VERSION="4.10"
SQUID_SHA256SUM="df0685e851a1b68eede3790423986e30f4e162e9f7cd1cf92dbea65177201c8f"

getpkg http://www.squid-cache.org/Versions/v4/squid-${SQUID_VERSION}.tar.gz $SQUID_SHA256SUM
tar zxf squid-${SQUID_VERSION}.tar.gz
cd squid-${SQUID_VERSION}
./configure --prefix=$VENV --disable-auth --with-krb5-config=no --disable-external-acl-helpers --disable-eui --disable-arch-native --without-expat --without-libxml2 --without-gnutls --without-mit-krb5 --without-heimdal-krb5 --without-gnugss --without-netfilter-conntrack --without-libcap --without-nettle \
    --disable-strict-error-checking
    # above fix re deprecated apis on macos 3/2020

$PMAKE
make install
