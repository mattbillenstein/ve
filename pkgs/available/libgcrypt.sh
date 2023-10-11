LIBGPG_ERROR_VERSION="1.47"
LIBGPG_ERROR_SHA256SUM="9e3c670966b96ecc746c28c2c419541e3bcb787d1a73930f5e5f5e1bcbbb9bdb"

rm -fR libgpg-error*
getpkg https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${LIBGPG_ERROR_VERSION}.tar.bz2 $LIBGPG_ERROR_SHA256SUM
tar jxf libgpg-error-${LIBGPG_ERROR_VERSION}.tar.bz2
cd libgpg-error-${LIBGPG_ERROR_VERSION}

./configure --prefix=$VENV
$PMAKE
make install

cd $BUILD_DIR

LIBGCRYPT_VERSION="1.10.2"
LIBGCRYPT_SHA256SUM="3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03"

rm -fR libgcrypt*
getpkg https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${LIBGCRYPT_VERSION}.tar.bz2 $LIBGCRYPT_SHA256SUM
tar jxf libgcrypt-${LIBGCRYPT_VERSION}.tar.bz2
cd libgcrypt-${LIBGCRYPT_VERSION}

./configure --prefix=$VENV --enable-random=linux # 10/2023 configure bug on macos...
$PMAKE
make install
