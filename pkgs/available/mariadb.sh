MARIADB_VERSION="10.4.12"
MARIADB_SHA256SUM="fef1e1d38aa253dd8a51006bd15aad184912fce31c446bb69434fcde735aa208"

getpkg https://downloads.mariadb.org/interstitial/mariadb-${MARIADB_VERSION}/source/mariadb-${MARIADB_VERSION}.tar.gz $MARIADB_SHA256SUM
tar zxf mariadb-${MARIADB_VERSION}.tar.gz
cd mariadb-${MARIADB_VERSION}

# FIXME - this links against the system openssl on MacOS instead of the Fink
# version...

mkdir -p $VENV/opt/mysql

cmake . \
-DCMAKE_INSTALL_PREFIX=$VENV/opt/mysql \
-DCMAKE_PREFIX_PATH=$VENV \
-DCMAKE_FIND_FRAMEWORK=LAST \
-DCMAKE_VERBOSE_MAKEFILE=ON \
-DMYSQL_DATADIR=$DATA_DIR/mysql \
-DWITH_SSL=system \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITHOUT_TOKUDB=1 \
-DWITH_UNIT_TESTS=OFF \
-DENABLED_LOCAL_INFILE=1

$PMAKE
make install
