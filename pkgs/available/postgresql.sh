POSTGRES_VERSION="11.5"
getpkg http://ftp.postgresql.org/pub/source/v${POSTGRES_VERSION}/postgresql-${POSTGRES_VERSION}.tar.bz2
tar jxf postgresql-${POSTGRES_VERSION}.tar.bz2
cd postgresql-${POSTGRES_VERSION}

# hack default socket dir
sed -i -e 's:DEFAULT_PGSOCKET_DIR[ ][ ]*"/tmp":DEFAULT_PGSOCKET_DIR "/data/run/pg":' src/include/pg_config_manual.h

./configure --prefix=$VENV --with-openssl --with-uuid=e2fs
$PMAKE
make install

PGEXTS="fuzzystrmatch hstore intarray pg_trgm tablefunc unaccent uuid-ossp citext pgcrypto ltree"

for ext in $PGEXTS; do
cd contrib/$ext
$PMAKE
make install
cd ../..
done

cd $BUILD_DIR

POSTGIS_VERSION="2.5.2"
getpkg https://download.osgeo.org/postgis/source/postgis-${POSTGIS_VERSION}.tar.gz
tar zxf postgis-${POSTGIS_VERSION}.tar.gz
cd postgis-${POSTGIS_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
cd ..
