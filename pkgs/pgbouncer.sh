PGBOUNCER_VERSION="1.5.5"
getpkg https://pgbouncer.github.io/downloads/pgbouncer-${PGBOUNCER_VERSION}.tar.gz
tar zxvf pgbouncer-${PGBOUNCER_VERSION}.tar.gz
cd pgbouncer-${PGBOUNCER_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
