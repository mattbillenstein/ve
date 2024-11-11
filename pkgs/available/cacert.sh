
# so many different packages include their own out of date bundles -- replace
# them all with the one mozilla uses using a script from the curl source

cd $BUILD_DIR

git clone --depth=1 https://github.com/bagder/curl.git
cd curl/scripts
./mk-ca-bundle.pl
cp ca-bundle.crt $BUILD_DIR/cacert.pem

cd $BUILD_DIR

for target in $(find $VENV -name 'cacert.pem' | grep -v $VENV/build/cacert.pem); do
  cp cacert.pem $target
done

for target in $(find $VENV -name 'cert.pem'); do
  cp cacert.pem $target
done

# used by openresty lua
mkdir -p $VENV/ssl
cp cacert.pem $VENV/ssl/
