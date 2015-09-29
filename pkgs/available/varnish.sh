VARNISH_VERSION="4.0.3"

(
source $VENV/bin/activate
pip install docutils

rm -fR varnish-${VARNISH_VERSION}*
getpkg https://repo.varnish-cache.org/source/varnish-${VARNISH_VERSION}.tar.gz

tar zxf varnish-${VARNISH_VERSION}.tar.gz
cd varnish-${VARNISH_VERSION}
if [ "$MOS" == "OSX" ]; then
CFLAGS="-Qunused-arguments $CFLAGS"
fi
./configure --prefix=$VENV --localstatedir=/data/varnish
$PMAKE
make install
)
