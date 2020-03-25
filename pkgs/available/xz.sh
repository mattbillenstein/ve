XZ_VERSION="5.2.4"
XZ_SHA256SUM="b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145"

rm -fR xz*
getpkg https://tukaani.org/xz/xz-${XZ_VERSION}.tar.gz $XZ_SHA256SUM
tar zxvf xz-${XZ_VERSION}.tar.gz 
cd xz-${XZ_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
