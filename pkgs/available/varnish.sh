VARNISH_VERSION="4.1.8"

rm -fR varnish-${VARNISH_VERSION}*
getpkg http://varnish-cache.org/_downloads/varnish-${VARNISH_VERSION}.tgz

tar zxf varnish-${VARNISH_VERSION}.tgz
cd varnish-${VARNISH_VERSION}
./configure --prefix=$VENV --localstatedir=/data/varnish
$PMAKE
make install
