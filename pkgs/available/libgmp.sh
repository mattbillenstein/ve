GMP_VERSION="6.2.1"
GMP_SHA256SUM="fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2"

rm -fR gmp*
getpkg https://gmplib.org/download/gmp/gmp-${GMP_VERSION}.tar.xz $GMP_SHA256SUM
tar Jxf gmp-${GMP_VERSION}.tar.xz
cd gmp-${GMP_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
