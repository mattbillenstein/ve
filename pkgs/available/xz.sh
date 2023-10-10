XZ_VERSION="5.4.4"
XZ_SHA256SUM="aae39544e254cfd27e942d35a048d592959bd7a79f9a624afb0498bb5613bdf8"

rm -fR xz*
getpkg https://tukaani.org/xz/xz-${XZ_VERSION}.tar.gz $XZ_SHA256SUM
tar zxf xz-${XZ_VERSION}.tar.gz
cd xz-${XZ_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
