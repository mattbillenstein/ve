VARNISH_VERSION="7.4.1"
VARNISH_SHA256SUM="874d837aaf49b8f2718cb60b8c8c7900e9ea10c264f218c88cd672d596f4b89f"

rm -fR varnish-${VARNISH_VERSION}*
getpkg https://varnish-cache.org/_downloads/varnish-${VARNISH_VERSION}.tgz $VARNISH_SHA256SUM

tar zxf varnish-${VARNISH_VERSION}.tgz
cd varnish-${VARNISH_VERSION}
./configure --prefix=$VENV --localstatedir=$DATA_DIR/varnish --with-sphinx-build=false
$PMAKE
make install
