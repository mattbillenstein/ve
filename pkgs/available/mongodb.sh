MONGODB_VERSION="3.4.7"
if [ "$MOS" == "OSX" ]; then
getpkg https://fastdl.mongodb.org/osx/mongodb-osx-x86_64-${MONGODB_VERSION}.tgz
mv mongodb-osx-x86_64-${MONGODB_VERSION}.tgz mongodb.tgz
else
getpkg https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1404-${MONGODB_VERSION}.tgz
mv mongodb-linux-x86_64-ubuntu1404-${MONGODB_VERSION}.tgz mongodb.tgz
fi

tar zxf mongodb.tgz
mv mongodb-*/bin/* $VENV/bin/
