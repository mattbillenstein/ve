MONGODB_VERSION="7.0.2"
MONGODB_TOOLS_VERSION="100.8.0"

mkdir -p $VENV/bin

if [ "$MOS" == "MacOS" ]; then
  MONGODB_SHA256SUM="6d1d08549da53a3114cfb6ce50b157ee556a545f295197af0d75147e85f53cb3"
  MONGODB_TOOLS_SHA256SUM="2f5147678df476fcfe4527eedecbc868e2cc68484f15964dea1bd1ea6494fde8"
  if [ "$MARCH" == "arm64" ]; then
    MONGODB_SHA256SUM="667d1c7917d9cc67a3b4761131b7b3910d59c76f41609a8be193c80c257c6d52"
    MONGODB_TOOLS_SHA256SUM="63618cb61875d0e73c95b03e5c70f99906dbcb464326d31f4f0568ef9bedb3f7"
  fi

  getpkg https://fastdl.mongodb.org/osx/mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz
  mv mongodb-macos-${MARCH}-${MONGODB_VERSION}/bin/* $VENV/bin/

  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}.zip $MONGODB_TOOLS_SHA256SUM
  unzip mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}.zip
  mv mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
else
  MONGODB_SHA256SUM="c9b5a0a4bc474ab31b7942800183fad31aea0f8226859773c3939723e75eafb2"
  getpkg https://fastdl.mongodb.org/linux/mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}.tgz
  mv mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}/bin/* $VENV/bin/

  MONGODB_TOOLS_SHA256SUM="1dd3342c8dd45d2e39976386660677f42d15e1d744cd2707ca73f55acaf94f3b"
  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}.tgz $MONGODB_TOOLS_SHA256SUM
  tar zxf mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}.tgz
  mv mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
fi

rm -fr mongodb*
