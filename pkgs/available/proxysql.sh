# no macos support...
if [ "$MOS" != "MacOS" ]; then
    PROXYSQL_VERSION="2.2.1"
    PROXYSQL_SHA256SUM="d0110aad5095596bfb2204da1c845863b8a18e68c7b664b6649cce7a53896a71"

    rm -fR  proxysql*

    getpkg https://github.com/sysown/proxysql/archive/refs/tags/v${PROXYSQL_VERSION}.tar.gz $PROXYSQL_SHA256SUM
    mv v${PROXYSQL_VERSION}.tar.gz proxysql-${PROXYSQL_VERSION}.tar.gz
    tar zxf proxysql-${PROXYSQL_VERSION}.tar.gz

    cd proxysql-${PROXYSQL_VERSION}
    GIT_VERSION="$PROXYSQL_VERSION" make
    cp src/proxysql $VENV/bin/
fi
