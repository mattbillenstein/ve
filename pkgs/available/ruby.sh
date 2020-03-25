RUBY_VERSION="2.6.5"
RUBY_SHA256SUM="66976b716ecc1fd34f9b7c3c2b07bbd37631815377a2e3e85a5b194cfdcbed7d"

getpkg https://cache.ruby-lang.org/pub/ruby/2.6/ruby-${RUBY_VERSION}.tar.gz $RUBY_SHA256SUM
tar zxf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

OPTS="--disable-install-doc --enable-shared --enable-static --with-jemalloc"
if [ "$MOS" == "MacOS" ]; then
OPTS="$OPTS --without-gmp"
fi

./configure --prefix=$VENV $OPTS
$PMAKE
make install
