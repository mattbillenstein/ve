# This is the last package built -- add your dependencies here,
# python/ruby/node pkgs, etc.

gem install sass --version "=3.4.19"
npm install -g grunt-cli

if [ "$MOS" == "Ubuntu" ]; then
sudo apt-get -y install fortune cowsay
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
sudo apt-get -y install libc6-i386 lib32z1 lib32gcc1
fi

for pkg in platform-tools build-tools-23.0.2 android-17 android-19; do
$VENV/android-sdk/tools/android update sdk --no-ui --filter "$pkg" <<EOF
y
EOF
done

cd $BUILD_DIR
mkdir klassmaster
cd klassmaster
RSYNC_PASSWORD="fdc30617-6818-47fb-bb81-245c73777dda" \
rsync -av --progress ve@matt.apptimize.co::ve/KlassMaster.zip .
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
