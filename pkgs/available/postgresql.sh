POSTGRES_VERSION="9.4.4"
getpkg http://ftp.postgresql.org/pub/source/v${POSTGRES_VERSION}/postgresql-${POSTGRES_VERSION}.tar.bz2
tar jxvf postgresql-${POSTGRES_VERSION}.tar.bz2
cd postgresql-${POSTGRES_VERSION}
./configure --prefix=$VENV --with-openssl
$PMAKE
make install
for ext in pgcrypto hstore; do
cd contrib/$ext
$PMAKE
make install
cd ../..
done
