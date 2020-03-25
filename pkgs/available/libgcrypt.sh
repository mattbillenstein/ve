#LIBGPG_ERROR_VERSION="1.36"
#LIBGPG_ERROR_SHA256SUM="babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c"
#
#rm -fR libgpg-error*
#getpkg https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${LIBGPG_ERROR_VERSION}.tar.bz2 $LIBGPG_ERROR_SHA256SUM
#tar jxvf libgpg-error-${LIBGPG_ERROR_VERSION}.tar.bz2
#cd libgpg-error-${LIBGPG_ERROR_VERSION}

# fixes for gawk to be released in 1.37
git clone https://github.com/gpg/libgpg-error.git
cd libgpg-error
git checkout 308574372055662c76d27f1681b182afddce9166

cat > doc/version.texi <<EOF
@set UPDATED 21 December 2019
@set UPDATED-MONTH December 2019
@set EDITION 1.37
@set VERSION 1.37
EOF

./autogen.sh
./configure --prefix=$VENV
$PMAKE
make install

cd $BUILD_DIR

LIBGCRYPT_VERSION="1.8.5"
LIBGCRYPT_SHA256SUM="3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3"

rm -fR libgcrypt*
getpkg https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${LIBGCRYPT_VERSION}.tar.bz2 $LIBGCRYPT_SHA256SUM
tar jxvf libgcrypt-${LIBGCRYPT_VERSION}.tar.bz2
cd libgcrypt-${LIBGCRYPT_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
