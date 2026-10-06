RUBY_VERSION="4.0.7"
RUBY_SHA256SUM="911ace20f90d068ca0e4dda6d0e4f0f81e52e52f2dd4f4004c721e253412e82d"

getpkg https://cache.ruby-lang.org/pub/ruby/${RUBY_VERSION%.*}/ruby-${RUBY_VERSION}.tar.gz $RUBY_SHA256SUM
tar zxf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

OPTS="--disable-install-doc --enable-shared --enable-static"
./configure --prefix=$VENV $OPTS
$PMAKE
make install
