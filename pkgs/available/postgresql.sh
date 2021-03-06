POSTGRES_VERSION="13.2"
POSTGRES_SHA256SUM="5fd7fcd08db86f5b2aed28fcfaf9ae0aca8e9428561ac547764c2a2b0f41adfc"
getpkg http://ftp.postgresql.org/pub/source/v${POSTGRES_VERSION}/postgresql-${POSTGRES_VERSION}.tar.bz2 $POSTGRES_SHA256SUM
tar jxf postgresql-${POSTGRES_VERSION}.tar.bz2
cd postgresql-${POSTGRES_VERSION}

# hack default socket dir
sed -i -e 's:DEFAULT_PGSOCKET_DIR[ ][ ]*"/tmp":DEFAULT_PGSOCKET_DIR "$DATA_DIR/run/pg":' src/include/pg_config_manual.h

./configure --prefix=$VENV --with-openssl --with-uuid=e2fs
$PMAKE
make install

PGEXTS="hstore pg_trgm pgstattuple uuid-ossp"

for ext in $PGEXTS; do
cd contrib/$ext
$PMAKE
make install
cd ../..
done

cd $BUILD_DIR
