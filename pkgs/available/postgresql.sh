POSTGRES_VERSION="15.4"
POSTGRES_SHA256SUM="baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9"
getpkg http://ftp.postgresql.org/pub/source/v${POSTGRES_VERSION}/postgresql-${POSTGRES_VERSION}.tar.bz2 $POSTGRES_SHA256SUM
tar jxf postgresql-${POSTGRES_VERSION}.tar.bz2
cd postgresql-${POSTGRES_VERSION}

# hack default socket dir
sed -i -e "s:DEFAULT_PGSOCKET_DIR[ ][ ]*\"/tmp\":DEFAULT_PGSOCKET_DIR \"$RUN_DIR/pg\":" src/include/pg_config_manual.h

./configure --prefix=$VENV --with-openssl --with-uuid=e2fs
$PMAKE
make install

PGEXTS="hstore pg_trgm pgstattuple uuid-ossp citext pgcrypto"

for ext in $PGEXTS; do
cd contrib/$ext
$PMAKE
make install
cd ../..
done

cd $BUILD_DIR
