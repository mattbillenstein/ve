RUBY_VERSION="3.3.6"
RUBY_SHA256SUM="8dc48fffaf270f86f1019053f28e51e4da4cce32a36760a0603a9aee67d7fd8d"

getpkg https://cache.ruby-lang.org/pub/ruby/${RUBY_VERSION%.*}/ruby-${RUBY_VERSION}.tar.gz $RUBY_SHA256SUM
tar zxf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

OPTS="--disable-install-doc --enable-shared --enable-static"
./configure --prefix=$VENV $OPTS
$PMAKE
make install
