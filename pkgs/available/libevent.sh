LIBEVENT_VERSION="2.1.12-stable"
LIBEVENT_SHA256SUM="92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"

rm -fR libevent*
getpkg https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}/libevent-${LIBEVENT_VERSION}.tar.gz $LIBEVENT_SHA256SUM
tar zxf libevent-${LIBEVENT_VERSION}.tar.gz
cd libevent-${LIBEVENT_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
