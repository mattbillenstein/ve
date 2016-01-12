
# so many different packages include their own out of date bundles -- replace
# them all with the curl bundle

cd $BUILD_DIR
curl -O http://curl.haxx.se/ca/cacert.pem
for target in $(find $VENV -name 'cacert.pem' | grep -v $VENV/build/cacert.pem); do
cp cacert.pem $target
done
