RUBY_VERSION="2.7.4"
RUBY_SHA256SUM="3043099089608859fc8cce7f9fdccaa1f53a462457e3838ec3b25a7d609fbc5b"

getpkg https://cache.ruby-lang.org/pub/ruby/2.7/ruby-${RUBY_VERSION}.tar.gz $RUBY_SHA256SUM
tar zxf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

OPTS="--disable-install-doc --enable-shared --enable-static"
./configure --prefix=$VENV $OPTS
$PMAKE
make install
