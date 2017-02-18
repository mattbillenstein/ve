# test automation tooling
if [ "$MOS" == "OSX" ]; then
getpkg http://chromedriver.storage.googleapis.com/2.27/chromedriver_mac64.zip
unzip chromedriver_mac64.zip
mv chromedriver $VENV/bin/
else
getpkg http://chromedriver.storage.googleapis.com/2.27/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver $VENV/bin/
fi

# install homebrew
$VENV/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
BREW="/usr/local/bin/brew"
$BREW install libimobiledevice --HEAD  # install from HEAD to get important updates
$BREW install ideviceinstaller         # only works for ios 9. for ios 10, see below
$BREW install carthage

# appium requirements
$VENV/bin/npm install -g appium  # this does not install cleanly on arch...
$VENV/bin/npm install -g authorize-ios
$VENV/bin/npm install -g ios-deploy
$VENV/bin/gem install xcpretty

# pip install packages for automation support
$VENV/bin/pip install Appium-Python-Client
$VENV/bin/pip install enum34
$VENV/bin/pip install py
$VENV/bin/pip install pytest
$VENV/bin/pip install selenium
$VENV/bin/pip install subprocess32

# sym-link iproxy since it's the incorrect version
sudo mv /sw/bin/iproxy /sw/bin/iproxy_old
sudo ln -s /ave/bin/iproxy /sw/bin/iproxy

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
