MONGODB_VERSION="5.0.3"
MONGODB_TOOLS_VERSION="100.5.0"

mkdir -p $VENV/bin

if [ "$MOS" == "MacOS" ]; then
  MONGODB_SHA256SUM="fad04d5b2bc184d0ab0487889298d70ac1f6368043196b73d212a509848e2515"
  getpkg https://fastdl.mongodb.org/osx/mongodb-macos-x86_64-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-macos-x86_64-${MONGODB_VERSION}.tgz
  mv mongodb-macos-x86_64-${MONGODB_VERSION}/bin/* $VENV/bin/

  MONGODB_TOOLS_SHA256SUM="3bd4b4c570def5054d0046a90e25c6540b592ac6492efa07e1d429854f9f50b3"
  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-macos-x86_64-${MONGODB_TOOLS_VERSION}.zip $MONGODB_TOOLS_SHA256SUM
  unzip mongodb-database-tools-macos-x86_64-${MONGODB_TOOLS_VERSION}.zip
  mv mongodb-database-tools-macos-x86_64-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
else
  MONGODB_SHA256SUM="48b20a5a53f5fc42d9d26824e997a46f477a1bfeec20e247a7b7e14ccb5cbb68"
  getpkg https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2004-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-linux-x86_64-ubuntu2004-${MONGODB_VERSION}.tgz
  mv mongodb-linux-x86_64-ubuntu2004-${MONGODB_VERSION}/bin/* $VENV/bin/

  MONGODB_TOOLS_SHA256SUM="68fb4c93e99ae1212f1f9dc706dd41ddd84dffd4c31877e431fadb8987432b7e"
  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2004-x86_64-${MONGODB_TOOLS_VERSION}.tgz $MONGODB_TOOLS_SHA256SUM
  tar zxf mongodb-database-tools-ubuntu2004-x86_64-${MONGODB_TOOLS_VERSION}.tgz
  mv mongodb-database-tools-ubuntu2004-x86_64-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
fi

rm -fr mongodb*
