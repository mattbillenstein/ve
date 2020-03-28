VARNISH_VERSION="6.4.0"
VARNISH_SHA256SUM="f636ba2d881b146f480fb52efefae468b36c2c3e6620d07460f9ccbe364a76c2"

rm -fR varnish-${VARNISH_VERSION}*
getpkg http://varnish-cache.org/_downloads/varnish-${VARNISH_VERSION}.tgz $VARNISH_SHA256SUM

tar zxf varnish-${VARNISH_VERSION}.tgz
cd varnish-${VARNISH_VERSION}
./configure --prefix=$VENV --localstatedir=$DATA_DIR/varnish --with-sphinx-build=false
$PMAKE
make install
