PGBOUNCER_VERSION="1.12.0"
PGBOUNCER_SHA256SUM="1b3c6564376cafa0da98df3520f0e932bb2aebaf9a95ca5b9fa461e9eb7b273e"

getpkg https://pgbouncer.github.io/downloads/files/${PGBOUNCER_VERSION}/pgbouncer-${PGBOUNCER_VERSION}.tar.gz $PGBOUNCER_SHA256SUM
tar zxf pgbouncer-${PGBOUNCER_VERSION}.tar.gz
cd pgbouncer-${PGBOUNCER_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
