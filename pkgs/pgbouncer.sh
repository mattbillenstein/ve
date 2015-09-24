PGBOUNCER_VERSION="1.6.1"
getpkg http://pgbouncer.github.io/downloads/files/${PGBOUNCER_VERSION}/pgbouncer-${PGBOUNCER_VERSION}.tar.gz
getpkg https://pgbouncer.github.io/downloads/pgbouncer-${PGBOUNCER_VERSION}.tar.gz
tar zxvf pgbouncer-${PGBOUNCER_VERSION}.tar.gz
cd pgbouncer-${PGBOUNCER_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
