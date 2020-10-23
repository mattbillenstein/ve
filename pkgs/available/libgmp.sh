GMP_VERSION="6.2.0"
GMP_SHA256SUM="cadd49052b740ccc3d8075c24ceaefbe5128d44246d91d0ecc818b2f78b0ec9c"

rm -fR gmp*
getpkg https://gmplib.org/download/gmp/gmp-${GMP_VERSION}.tar.gz $GMP_SHA256SUM
tar zxvf gmp-${GMP_VERSION}.tar.gz 
cd gmp-${GMP_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
