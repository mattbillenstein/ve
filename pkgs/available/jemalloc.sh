JEMALLOC_VERSION="5.2.1"
JEMALLOC_SHA256SUM="34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6"

rm -fR ${JEMALLOC_VERSION}*
getpkg https://github.com/jemalloc/jemalloc/releases/download/${JEMALLOC_VERSION}/jemalloc-${JEMALLOC_VERSION}.tar.bz2 $JEMALLOC_SHA256SUM
tar jxvf jemalloc-${JEMALLOC_VERSION}.tar.bz2
cd jemalloc-${JEMALLOC_VERSION}

OPTS="--prefix=$VENV --disable-debug --disable-install-rdoc"
# this currently fails the macos build
#if [ "$MOS" == "MacOS" ]; then
#OPTS="$OPTS --with-jemalloc-prefix="
#fi
./configure $OPTS
$PMAKE
make install
