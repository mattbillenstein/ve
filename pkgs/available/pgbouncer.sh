PGBOUNCER_VERSION="1.17.0"
PGBOUNCER_SHA256SUM="657309b7bc5c7a85cbf70a9a441b535f7824123081eabb7ba86d00349a256e23"

getpkg https://pgbouncer.github.io/downloads/files/${PGBOUNCER_VERSION}/pgbouncer-${PGBOUNCER_VERSION}.tar.gz $PGBOUNCER_SHA256SUM
tar zxf pgbouncer-${PGBOUNCER_VERSION}.tar.gz
cd pgbouncer-${PGBOUNCER_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
