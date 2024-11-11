RUBY_VERSION="3.2.2"
RUBY_SHA256SUM="96c57558871a6748de5bc9f274e93f4b5aad06cd8f37befa0e8d94e7b8a423bc"

getpkg https://cache.ruby-lang.org/pub/ruby/${RUBY_VERSION%.*}/ruby-${RUBY_VERSION}.tar.gz $RUBY_SHA256SUM
tar zxf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

OPTS="--disable-install-doc --enable-shared --enable-static"
./configure --prefix=$VENV $OPTS
$PMAKE
make install
