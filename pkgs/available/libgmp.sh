GMP_VERSION="6.3.0"
GMP_SHA256SUM="a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898"

rm -fR gmp*
getpkg https://gmplib.org/download/gmp/gmp-${GMP_VERSION}.tar.xz $GMP_SHA256SUM
tar Jxf gmp-${GMP_VERSION}.tar.xz
cd gmp-${GMP_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
