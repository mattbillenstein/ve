MARIADB_VERSION="10.0.20"
getpkg https://downloads.mariadb.org/interstitial/mariadb-10.0.20/source/mariadb-${MARIADB_VERSION}.tar.gz
tar zxf mariadb-${MARIADB_VERSION}.tar.gz
cd mariadb-${MARIADB_VERSION}
BUILD/compile-pentium64-max --prefix=$VENV
make install

# max build install is huge - just remove some crap we probably don't need
rm -f $VENV/bin/mysql*_embedded
