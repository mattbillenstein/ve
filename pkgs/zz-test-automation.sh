# test automation tooling
if [ "$MOS" == "OSX" ]; then
getpkg http://chromedriver.storage.googleapis.com/2.25/chromedriver_mac64.zip
unzip chromedriver_mac64.zip
mv chromedriver $VENV/bin/
else
getpkg http://chromedriver.storage.googleapis.com/2.25/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver $VENV/bin/
fi
$VENV/bin/npm install -g appium  # this does not install cleanly on arch...
$VENV/bin/pip install Appium-Python-Client
$VENV/bin/pip install enum34
$VENV/bin/pip install py
$VENV/bin/pip install pytest
$VENV/bin/pip install selenium

if [ "$MOS" == "OSX" ]; then
cd $BUILD_DIR
# idevice installer
for PKG in libplist libusbmuxd libimobiledevice ideviceinstaller; do
rm -fR $PKG
git clone https://github.com/libimobiledevice/$PKG.git
cd $PKG
./autogen.sh --prefix=$VENV
$PMAKE install
cd ..
done
fi
