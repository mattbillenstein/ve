MONGODB_VERSION="4.0.13"

mkdir -p $VENV/bin

if [ "$MOS" == "MacOS" ]; then
MONGODB_SHA256SUM="b75ae14d620c15c40fffe8bf1106e1dc7e8d76218265db75c8a6a74df2ca764d"
getpkg https://fastdl.mongodb.org/osx/mongodb-osx-ssl-x86_64-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
mv mongodb-osx-ssl-x86_64-${MONGODB_VERSION}.tgz mongodb.tgz
else
MONGODB_SHA256SUM="d5d7696fdbad2ad93a86176bf982010ab1b8c7bb85c0eecd3ee62e1e4e1c5dbc"
getpkg https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
mv mongodb-linux-x86_64-${MONGODB_VERSION}.tgz mongodb.tgz
fi

tar zxf mongodb.tgz
mv mongodb-*/bin/* $VENV/bin/
