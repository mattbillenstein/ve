MONGODB_VERSION="7.0.2"
MONGODB_SHELL_VERSION="2.0.1"
MONGODB_TOOLS_VERSION="100.8.0"

mkdir -p $VENV/bin

if [ "$MOS" == "MacOS" ]; then
  MONGODB_SHA256SUM="6d1d08549da53a3114cfb6ce50b157ee556a545f295197af0d75147e85f53cb3"
  MONGODB_SHELL_SHA256SUM="6e4a8a94e6622aad97c86a1121806d5430ddb5ba499970156ae171e67edd5d0b"
  MONGODB_TOOLS_SHA256SUM="2f5147678df476fcfe4527eedecbc868e2cc68484f15964dea1bd1ea6494fde8"
  MONGODB_SHELL_ARCH="x64"
  if [ "$MARCH" == "arm64" ]; then
    MONGODB_SHA256SUM="667d1c7917d9cc67a3b4761131b7b3910d59c76f41609a8be193c80c257c6d52"
    MONGODB_SHELL_SHA256SUM="b8a0b0de6c88062b284f065c7c4f20c5eb6b210d65f1ca03e519d7334a7475bc"
    MONGODB_TOOLS_SHA256SUM="63618cb61875d0e73c95b03e5c70f99906dbcb464326d31f4f0568ef9bedb3f7"
    MONGODB_SHELL_ARCH="arm64"
  fi

  getpkg https://fastdl.mongodb.org/osx/mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz
  mv mongodb-macos-*-${MONGODB_VERSION}/bin/* $VENV/bin/

  getpkg https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-darwin-${MONGODB_SHELL_ARCH}.zip $MONGODB_SHELL_SHA256SUM
  unzip mongosh-${MONGODB_SHELL_VERSION}-darwin-${MONGODB_SHELL_ARCH}.zip
  mv mongosh-${MONGODB_SHELL_VERSION}-darwin-${MONGODB_SHELL_ARCH}/bin/* $VENV/bin/

  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}.zip $MONGODB_TOOLS_SHA256SUM
  unzip mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}.zip
  mv mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
else
  MONGODB_SHA256SUM="c9b5a0a4bc474ab31b7942800183fad31aea0f8226859773c3939723e75eafb2"
  MONGODB_SHELL_SHA256SUM="b3ca23c3720c6e773fdd692bd3d8014d9d0a2fe9df8854c6ad87fdd596834e4d"
  MONGODB_TOOLS_SHA256SUM="1dd3342c8dd45d2e39976386660677f42d15e1d744cd2707ca73f55acaf94f3b"
  MONGODB_SHELL_ARCH="x64"
  if [ "$MARCH" == "arm64" ]; then
    MONGODB_SHA256SUM=""
    MONGODB_SHELL_SHA256SUM=""
    MONGODB_TOOLS_SHA256SUM=""
    MONGODB_SHELL_ARCH="arm64"
  fi
  getpkg https://fastdl.mongodb.org/linux/mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}.tgz
  mv mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}/bin/* $VENV/bin/

  getpkg https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-linux-${MONGODB_SHELL_ARCH}.zip $MONGODB_SHELL_SHA256SUM
  unzip mongosh-${MONGODB_SHELL_VERSION}-linux-${MONGODB_SHELL_ARCH}.zip
  mv mongosh-${MONGODB_SHELL_VERSION}-linux-${MONGODB_SHELL_ARCH}/bin/* $VENV/bin/

  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}.tgz $MONGODB_TOOLS_SHA256SUM
  tar zxf mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}.tgz
  mv mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
fi

rm -fr mongodb*
