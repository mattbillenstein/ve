RUBY_VERSION="2.2.5"

getpkg http://cache.ruby-lang.org/pub/ruby/2.2/ruby-${RUBY_VERSION}.tar.gz
tar zxf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

OPTS="--disable-install-doc --enable-shared --enable-static"
if [ "$MOS" == "OSX" ]; then
OPTS="$OPTS --without-gmp --with-openssl-dir=/sw/include/openssl"
fi

LDFLAGS="-L/sw/lib" ./configure --prefix=$VENV $OPTS

$PMAKE
make install

$VENV/bin/gem install specific_install
