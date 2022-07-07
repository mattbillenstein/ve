MYSQL_VERSION="5.7.33-36"
MYSQL_SHA256SUM="964e32f4a1e235421e26be81d2d24f9e659d8ef3cbd9ae6c3e85fe545bedfd5b"

rm -fR $VENV/opt/mysql

getpkg https://downloads.percona.com/downloads/Percona-Server-5.7/Percona-Server-${MYSQL_VERSION}/source/tarball/percona-server-${MYSQL_VERSION}.tar.gz $MYSQL_SHA256SUM
tar zxf percona-server-${MYSQL_VERSION}.tar.gz

LIBBOOST_VERSION="1.59.0"
LIBBOOST_SHA256SUM="47f11c8844e579d02691a607fbd32540104a9ac7a2534a8ddaef50daf502baac"

getpkg http://sourceforge.net/projects/boost/files/boost/${LIBBOOST_VERSION}/boost_${LIBBOOST_VERSION//./_}.tar.gz $LIBBOOST_SHA256SUM
tar zxf boost_${LIBBOOST_VERSION//./_}.tar.gz

rm -fR $VENV/opt/mysql
mkdir -p $VENV/opt/mysql

cd percona-server-${MYSQL_VERSION}

cmake . \
-DSYSCONFDIR=/opt/etc \
-DCMAKE_INSTALL_PREFIX=$VENV/opt/mysql \
-DCMAKE_PREFIX_PATH=$VENV \
-DCMAKE_FIND_FRAMEWORK=LAST \
-DCMAKE_VERBOSE_MAKEFILE=ON \
-DMYSQL_DATADIR=$DATA_DIR/mysql/data \
-DWITH_SSL=system \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITHOUT_TOKUDB=1 \
-DWITHOUT_ROCKSDB=1 \
-DWITH_UNIT_TESTS=OFF \
-DENABLED_LOCAL_INFILE=1 \
-DINSTALL_STATIC_LIBRARIES=OFF \
-DENABLE_DOWNLOADS=OFF \
-DWITH_BOOST=$BUILD_DIR/boost_${LIBBOOST_VERSION//./_}

$PMAKE
make install

# clean some stuff...
rm -fR $VENV/opt/mysql/mysql-test $VENV/opt/mysql/lib/*.a $VENV/opt/mysql/bin/*_embedded
