SQUID_VERSION="4.7"
getpkg http://www.squid-cache.org/Versions/v4/squid-${SQUID_VERSION}.tar.gz
tar zxf squid-${SQUID_VERSION}.tar.gz
cd squid-${SQUID_VERSION}
./configure --prefix=$VENV --disable-auth --with-krb5-config=no --disable-external-acl-helpers --disable-eui --disable-arch-native --without-expat --without-libxml2 --without-gnutls --without-mit-krb5 --without-heimdal-krb5 --without-gnugss --without-netfilter-conntrack --without-libcap --without-nettle
$PMAKE
make install
