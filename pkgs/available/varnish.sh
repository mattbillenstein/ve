VARNISH_VERSION="6.4.0"
VARNISH_SHA256SUM=""

rm -fR varnish-${VARNISH_VERSION}*
getpkg http://varnish-cache.org/_downloads/varnish-${VARNISH_VERSION}.tgz $VARNISH_SHA256SUM

tar zxf varnish-${VARNISH_VERSION}.tgz
cd varnish-${VARNISH_VERSION}
./configure --prefix=$VENV --localstatedir=$DATA_DIR/varnish
$PMAKE
make install
