PGBOUNCER_VERSION="1.20.1"
PGBOUNCER_SHA256SUM="24992cf557d73426d7048698dffc7b019e6364d4d8757ae2cf5e2471286a2088"

getpkg https://pgbouncer.github.io/downloads/files/${PGBOUNCER_VERSION}/pgbouncer-${PGBOUNCER_VERSION}.tar.gz $PGBOUNCER_SHA256SUM
tar zxf pgbouncer-${PGBOUNCER_VERSION}.tar.gz
cd pgbouncer-${PGBOUNCER_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
