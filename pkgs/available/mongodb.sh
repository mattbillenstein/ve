MONGODB_VERSION="6.0.0"
MONGODB_TOOLS_VERSION="100.5.4"

mkdir -p $VENV/bin

if [ "$MOS" == "MacOS" ]; then
  if [ "$MARCH" == "arm64" ]; then
    MONGODB_SHA256SUM="aed3622e3854c85ae0de307802e593c91e5d8c59e497e659d8e42f7718db0ecb"
    MONGODB_TOOLS_SHA256SUM=""
  else
    MONGODB_SHA256SUM="312fccb8bc0465104533ba42ed5641c27382fd03ca52f074fbd5bc8291d28512"
    MONGODB_TOOLS_SHA256SUM="c69e2a361e49c3f6caf828441fee1c39de256134a36d7d003f3abdee49956625"
  fi

  getpkg https://fastdl.mongodb.org/osx/mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz
  mv mongodb-macos-aarch64-${MONGODB_VERSION} mongodb-macos-${MARCH}-${MONGODB_VERSION} || true
  mv mongodb-macos-${MARCH}-${MONGODB_VERSION}/bin/* $VENV/bin/

  if [ "$MONGODB_TOOLS_SHA256SUM" != "" ]; then
  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}.zip $MONGODB_TOOLS_SHA256SUM
  unzip mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}.zip
  mv mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
  fi
else
  MONGODB_SHA256SUM="1e2d68ae63351861b6e13dcda16f73a4a0d33e3cd627de2fa1254f33dd9db946"
  getpkg https://fastdl.mongodb.org/linux/mongodb-linux-${MARCH}-ubuntu2004-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-linux-${MARCH}-ubuntu2004-${MONGODB_VERSION}.tgz
  mv mongodb-linux-${MARCH}-ubuntu2004-${MONGODB_VERSION}/bin/* $VENV/bin/

  MONGODB_TOOLS_SHA256SUM="2263d59bde373a3ad20a3519da097ed3d5feff3cffae346a13d0f5a38d96e5c2"
  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2004-${MARCH}-${MONGODB_TOOLS_VERSION}.tgz $MONGODB_TOOLS_SHA256SUM
  tar zxf mongodb-database-tools-ubuntu2004-${MARCH}-${MONGODB_TOOLS_VERSION}.tgz
  mv mongodb-database-tools-ubuntu2004-${MARCH}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
fi

rm -fr mongodb*
