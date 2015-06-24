
# OSX has a very old version of openssl - use system ssl on other platforms
if [ "$MOS" == "OSX" ]; then

OPENSSL_VERSION="1.0.2c"

rm -fR openssl-$OPENSSL_VERSION.tar.gz openssl_i386 openssl_x86_64

curl -s -O http://www.openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz
tar zxf openssl-$OPENSSL_VERSION.tar.gz

mv openssl-$OPENSSL_VERSION openssl_i386
cp -a openssl_i386 openssl_x86_64

cd openssl_i386
./Configure darwin-i386-cc --prefix=$VENV -shared
make
cd ..

cd openssl_x86_64
./Configure darwin64-x86_64-cc --prefix=$VENV -shared
make
make install
cd ..

lipo -create openssl_i386/libcrypto.1.0.0.dylib openssl_x86_64/libcrypto.1.0.0.dylib -output libcrypto.1.0.0.dylib
lipo -create openssl_i386/libssl.1.0.0.dylib openssl_x86_64/libssl.1.0.0.dylib -output libssl.1.0.0.dylib

chmod 755 $VENV/lib/libcrypto.1.0.0.dylib $VENV/lib/libssl.1.0.0.dylib
cp libcrypto.1.0.0.dylib libssl.1.0.0.dylib $VENV/lib/
chmod 555 $VENV/lib/libcrypto.1.0.0.dylib $VENV/lib/libssl.1.0.0.dylib

fi
