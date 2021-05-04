PROXYSQL_VERSION="2.1.1"
PROXYSQL_SHA256SUM="182483b33c879572bbf78bda0efb1b890485c847fac11c2106f2b3357355001a"

rm -fR  proxysql*

getpkg https://github.com/sysown/proxysql/archive/refs/tags/v${PROXYSQL_VERSION}.tar.gz $PROXYSQL_SHA256SUM
mv v${PROXYSQL_VERSION}.tar.gz proxysql-${PROXYSQL_VERSION}.tar.gz
tar zxf proxysql-${PROXYSQL_VERSION}.tar.gz

cd proxysql-${PROXYSQL_VERSION}
GIT_VERSION="$PROXYSQL_VERSION" make
cp src/proxysql $VENV/bin/
