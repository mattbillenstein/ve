RUBY_VERSION="2.2.3"

getpkg http://cache.ruby-lang.org/pub/ruby/2.2/ruby-${RUBY_VERSION}.tar.gz
tar zxf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
