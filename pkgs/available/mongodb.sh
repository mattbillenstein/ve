MONGODB_VERSION="7.0.20"
MONGODB_SHELL_VERSION="2.5.0"
MONGODB_TOOLS_VERSION="100.12.0"

if false; then
KERNEL="darwin"
MONGODB_OS="macos"
for ARCH_X86_64_ARM64 in x86_64 arm64; do
ARCH_X64_ARM64="$(echo $ARCH_X86_64_ARM64 | sed -e 's/x86_64/x64/')"
echo
echo "# $MONGODB_OS $ARCH_X86_64_ARM64 $ARCH_X64_ARM64"
echo MONGODB_SHA256SUM="\"$(curl -s -L https://fastdl.mongodb.org/osx/mongodb-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_VERSION}.tgz | sha256sum | awk '{print $1}')\""
echo MONGODB_SHELL_SHA256SUM="\"$(curl -s -L https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-${KERNEL}-${ARCH_X64_ARM64}.zip | sha256sum | awk '{print $1}')\""
echo MONGODB_TOOLS_SHA256SUM="\"$(curl -s -L https://fastdl.mongodb.org/tools/db/mongodb-database-tools-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_TOOLS_VERSION}.zip | sha256sum | awk '{print $1}')\""
done

echo

KERNEL="linux"
MONGODB_OS="ubuntu2204"
for ARCH_X86_64_ARM64 in x86_64 arm64; do
ARCH_X64_ARM64="$(echo $ARCH_X86_64_ARM64 | sed -e 's/x86_64/x64/')"
ARCH_X86_64_AARCH64="$(echo $ARCH_X86_64_ARM64 | sed -e 's/arm64/aarch64/')"
echo
echo "# $MONGODB_OS $ARCH_X86_64_ARM64 $ARCH_X64_ARM64 $ARCH_X86_64_AARCH64"
echo MONGODB_SHA256SUM="\"$(curl -s -L https://fastdl.mongodb.org/linux/mongodb-${KERNEL}-${ARCH_X86_64_AARCH64}-${MONGODB_OS}-${MONGODB_VERSION}.tgz | sha256sum | awk '{print $1}')\""
echo MONGODB_SHELL_SHA256SUM="\"$(curl -s -L https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-${KERNEL}-${ARCH_X64_ARM64}.tgz | sha256sum | awk '{print $1}')\""
echo MONGODB_TOOLS_SHA256SUM="\"$(curl -s -L https://fastdl.mongodb.org/tools/db/mongodb-database-tools-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_TOOLS_VERSION}.tgz | sha256sum | awk '{print $1}')\""
done
exit 0
fi

mkdir -p $VENV/bin

if [ "$MOS" == "MacOS" ]; then
  MONGODB_OS="macos"
  # macos x86_64 x64
  MONGODB_SHA256SUM="2e17856b63ee87e1c84639e429c9c0a664bfd51141b954a8343b726fd3cb3f47"
  MONGODB_SHELL_SHA256SUM="2333c9a4e20d12f2f56dfa4912731021976da6025e55938654f152bb197c8994"
  MONGODB_TOOLS_SHA256SUM="0582742bb61a4b348918a108e70e697f65eb63ec15f601db6f13415540bb1755"
  if [ "$ARCH_X64_ARM64" == "arm64" ]; then
    # macos arm64 arm64
    MONGODB_SHA256SUM="fc86aed6f9c9f5f35d6bd523968bf6ebfb3167728f64c4f98092fd351d0fd534"
    MONGODB_SHELL_SHA256SUM="7f803a0d0be9c03c57b9c4641824b7f649003dd27c94e6d075903ef7b8c4ea14"
    MONGODB_TOOLS_SHA256SUM="85ccf826976638e48844d929f60d2e6d91f8b7e5100ee74b19e045c4d1e828f3"
  fi

  getpkg https://fastdl.mongodb.org/osx/mongodb-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_VERSION}.tgz
  mv mongodb-${MONGODB_OS}-*-${MONGODB_VERSION}/bin/* $VENV/bin/

  getpkg https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-${KERNEL}-${ARCH_X64_ARM64}.zip $MONGODB_SHELL_SHA256SUM
  unzip mongosh-${MONGODB_SHELL_VERSION}-${KERNEL}-${ARCH_X64_ARM64}.zip
  mv mongosh-${MONGODB_SHELL_VERSION}-${KERNEL}-${ARCH_X64_ARM64}/bin/* $VENV/bin/

  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_TOOLS_VERSION}.zip $MONGODB_TOOLS_SHA256SUM
  unzip mongodb-database-tools-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_TOOLS_VERSION}.zip
  mv mongodb-database-tools-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
else
  MONGODB_OS="ubuntu2204"
  # ubuntu2204 x86_64 x64 x86_64
  MONGODB_SHA256SUM="7ed90600c5cf17d870c397652072df714e3d7023edfdde384b75cba57c1af16c"
  MONGODB_SHELL_SHA256SUM="d1dfc44f2b4de11c2b66994715c00bcf26eea0e29a763195c2420b262bf38f00"
  MONGODB_TOOLS_SHA256SUM="426cc14f6d2247284d557d61eb3e9d4bd4f19943a15e7ffb38354008a0cf3892"
  if [ "$ARCH_X64_ARM64" == "arm64" ]; then
    # ubuntu2204 arm64 arm64 aarch64
    MONGODB_SHA256SUM="8d376804a8efba0d57d231a20f1532ab99f84ee2d17d9c75d26772c8b2a8a85a"
    MONGODB_SHELL_SHA256SUM="6b73cc51856b035362c366710184c011718915a0b48817722fca512f6ac4cbb4"
    MONGODB_TOOLS_SHA256SUM="cb4054e2c6de59a2eab9becdf456fb0ddd1ad54a9c305736c2b35cb2fee9aad9"
  fi

  getpkg https://fastdl.mongodb.org/linux/mongodb-${KERNEL}-${ARCH_X86_64_AARCH64}-${MONGODB_OS}-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-${KERNEL}-${ARCH_X86_64_AARCH64}-${MONGODB_OS}-${MONGODB_VERSION}.tgz
  mv mongodb-${KERNEL}-${ARCH_X86_64_AARCH64}-${MONGODB_OS}-${MONGODB_VERSION}/bin/* $VENV/bin/

  getpkg https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-${KERNEL}-${ARCH_X64_ARM64}.tgz $MONGODB_SHELL_SHA256SUM
  tar zxf mongosh-${MONGODB_SHELL_VERSION}-${KERNEL}-${ARCH_X64_ARM64}.tgz
  mv mongosh-${MONGODB_SHELL_VERSION}-${KERNEL}-${ARCH_X64_ARM64}/bin/* $VENV/bin/

  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_TOOLS_VERSION}.tgz $MONGODB_TOOLS_SHA256SUM
  tar zxf mongodb-database-tools-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_TOOLS_VERSION}.tgz
  mv mongodb-database-tools-${MONGODB_OS}-${ARCH_X86_64_ARM64}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
fi

rm -fr mongodb*
