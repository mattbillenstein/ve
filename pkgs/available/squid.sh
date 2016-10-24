getpkg http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.22.tar.gz
tar zxvf squid-3.5.22.tar.gz
cd squid-3.5.22
./configure --prefix=$VENV --disable-auth --with-krb5-config=no --disable-external-acl-helpers --disable-eui --disable-arch-native --without-expat --without-libxml2 --without-gnutls --without-mit-krb5 --without-heimdal-krb5 --without-gnugss --without-netfilter-conntrack --without-libcap --without-nettle
$PMAKE
make install
