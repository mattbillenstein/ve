LIBEVENT_VERSION="2.1.11-stable"
LIBEVENT_SHA256SUM="a65bac6202ea8c5609fd5c7e480e6d25de467ea1917c08290c521752f147283d"

rm -fR libevent*
getpkg https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}/libevent-${LIBEVENT_VERSION}.tar.gz $LIBEVENT_SHA256SUM
tar zxvf libevent-${LIBEVENT_VERSION}.tar.gz 
cd libevent-${LIBEVENT_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
