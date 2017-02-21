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
if [ "$MOS" == "OSX" ]; then
$VENV/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
BREW="/usr/local/bin/brew"
$BREW install libimobiledevice --HEAD  # install from HEAD to get important updates
$BREW install ideviceinstaller         # only works for ios 9. for ios 10, see below
$BREW install carthage
fi

# appium requirements
$VENV/bin/npm install -g appium  # this does not install cleanly on arch...
if [ "$MOS" == "OSX" ]; then
$VENV/bin/npm install -g authorize-ios
$VENV/bin/npm install -g ios-deploy
$VENV/bin/gem install xcpretty
fi

# pip install packages for automation support
$VENV/bin/pip install Appium-Python-Client
$VENV/bin/pip install enum34
$VENV/bin/pip install py
$VENV/bin/pip install pytest
$VENV/bin/pip install selenium
$VENV/bin/pip install subprocess32

# sym-link iproxy since it's the incorrect version
if [ "$MOS" == "OSX" ]; then
sudo mv /sw/bin/iproxy /sw/bin/iproxy_old
sudo ln -s /ave/bin/iproxy /sw/bin/iproxy
fi
