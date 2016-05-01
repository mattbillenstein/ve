# This is the last package built -- add your dependencies here,
# python/ruby/node pkgs, etc.

gem install sass --version "=3.4.19"
npm install -g grunt-cli

if [ "$MOS" == "Ubuntu" ]; then
sudo apt-get -y install fortune cowsay
elif [ "$MOS" == "Arch" ]; then
sudo pacman --sync --needed --noconfirm fortune-mod cowsay
fi

getpkg http://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/3.2.1/flyway-commandline-3.2.1.tar.gz
tar zxf flyway-commandline-3.2.1.tar.gz
mv flyway-3.2.1 $VENV/flyway
chmod 755 $VENV/flyway/flyway

ANDROID_SDK_VERSION="r24.4.1"
if [ "$MOS" == "OSX" ]; then
getpkg http://dl.google.com/android/android-sdk_${ANDROID_SDK_VERSION}-macosx.zip
unzip android-sdk_${ANDROID_SDK_VERSION}-macosx.zip
mv android-sdk-macosx $VENV/android-sdk
else
getpkg http://dl.google.com/android/android-sdk_${ANDROID_SDK_VERSION}-linux.tgz
tar zxvf android-sdk_${ANDROID_SDK_VERSION}-linux.tgz
mv android-sdk-linux $VENV/android-sdk

if [ "$MOS" == "Ubuntu" ]; then
sudo apt-get -y install libc6-i386 lib32z1 lib32gcc1
elif [ "$MOS" == "Arch" ]; then
echo "FIXME - arch i386 libs for android?"
fi

fi

for pkg in platform-tools build-tools-23.0.3 android-19 android-22 sys-img-armeabi-v7a-android-19 sys-img-armeabi-v7a-android-22; do
$VENV/android-sdk/tools/android update sdk --no-ui --all --filter "$pkg" <<EOF
y
EOF
done

cat > $VENV/android-sdk/tools/android-wait-for-emulator <<EOF
#!/bin/bash

# Originally written by Ralf Kistner <ralf@embarkmobile.com>, but placed in the public domain

set +e

bootanim=""
failcounter=0
timeout_in_sec=360

until [[ "\$bootanim" =~ "stopped" ]]; do
  bootanim="\$($VENV/android-sdk/platform-tools/adb -e shell getprop init.svc.bootanim 2>&1)"
  if [[ "\$bootanim" =~ "device not found" || "\$bootanim" =~ "device offline"
    || "\$bootanim" =~ "running" || "\$bootanim" =~ "error" ]]; then
    let "failcounter += 1"
    echo "Waiting for emulator to start \$failcounter"
    if [[ \$failcounter -gt timeout_in_sec ]]; then
      echo "Timeout (\$timeout_in_sec seconds) reached; failed to start emulator"
      exit 1
    fi
  fi
  sleep 1
done

echo "Emulator is ready"
EOF
chmod 755 $VENV/android-sdk/tools/android-wait-for-emulator
find $VENV/android-sdk/tools -type f -maxdepth 1 -perm 744 | xargs chmod 755

cd $BUILD_DIR
mkdir klassmaster
cd klassmaster
RSYNC_PASSWORD="fdc30617-6818-47fb-bb81-245c73777dda" \
rsync -av --progress ve@netops.apptimize.co::ve/KlassMaster.zip .
unzip KlassMaster.zip
rm KlassMaster.zip
cd $BUILD_DIR
mv klassmaster $VENV

# iOS SDK build tools
if [ "$MOS" == "OSX" ]; then
cd $BUILD_DIR
git clone https://github.com/tomaz/appledoc.git
cd appledoc
mkdir -p $VENV/share/appledoc
./install-appledoc.sh -b $VENV/bin -t $VENV/share/appledoc
cd $BUILD_DIR

gem install cocoapods
fi

cd $BUILD_DIR
PROTOBUF_VERSION="2.6.1"
getpkg https://github.com/google/protobuf/releases/download/v${PROTOBUF_VERSION}/protobuf-${PROTOBUF_VERSION}.tar.gz
tar zxf protobuf-${PROTOBUF_VERSION}.tar.gz
cd protobuf-${PROTOBUF_VERSION}
./configure --prefix=$VENV
$PMAKE install
$VENV/bin/pip install protobuf

# pkgs for dealing with tweak debian repos
$VENV/bin/pip install chardet python-debian

# reviewboard tools
$VENV/bin/pip install git+https://github.com/mattbillenstein/rbtools.git

cd $BUILD_DIR
# pypy pkgs
$VENV/pypy/bin/pip install protobuf pynsq google-api-python-client

# test automation tooling
if [ "$MOS" == "OSX" ]; then
getpkg http://chromedriver.storage.googleapis.com/2.21/chromedriver_mac32.zip
unzip chromedriver_mac32.zip
mv chromedriver $VENV/bin/
else
getpkg http://chromedriver.storage.googleapis.com/2.21/chromedriver_linux64.zip
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

# azure tooling
npm install -g azure-cli
$VENV/bin/pip install --pre azure
