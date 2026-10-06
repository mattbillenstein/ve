VINYL_VERSION="9.1.0"
VINYL_SHA256SUM="3840a06dd0cd212fd1e3beeb8b086dbd7c35ca31cfe1962fe2586363a63410aa"

rm -fR vinyl-${VINYL_VERSION}*
getpkg https://vinyl-cache.org/downloads/vinyl-cache-${VINYL_VERSION}.tgz $VINYL_SHA256SUM

tar zxf vinyl-cache-${VINYL_VERSION}.tgz
cd vinyl-cache-${VINYL_VERSION}
./configure --prefix=$VENV --localstatedir=$DATA_DIR/vinyl --with-sphinx-build=false
$PMAKE
make install
