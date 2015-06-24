
LIBRESSL_VERSION="2.1.7"
getpkg http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${LIBRESSL_VERSION}.tar.gz
tar zxf libressl-${LIBRESSL_VERSION}.tar.gz
cd libressl-${LIBRESSL_VERSION}
./configure --prefix=$VENV
$PMAKE install
