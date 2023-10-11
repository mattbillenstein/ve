JEMALLOC_VERSION="5.3.0"
JEMALLOC_SHA256SUM="2db82d1e7119df3e71b7640219b6dfe84789bc0537983c3b7ac4f7189aecfeaa"

rm -fR ${JEMALLOC_VERSION}*
getpkg https://github.com/jemalloc/jemalloc/releases/download/${JEMALLOC_VERSION}/jemalloc-${JEMALLOC_VERSION}.tar.bz2 $JEMALLOC_SHA256SUM
tar jxf jemalloc-${JEMALLOC_VERSION}.tar.bz2
cd jemalloc-${JEMALLOC_VERSION}

OPTS="--prefix=$VENV --disable-debug --disable-install-rdoc"
# this currently fails the macos build
#if [ "$MOS" == "MacOS" ]; then
#OPTS="$OPTS --with-jemalloc-prefix="
#fi
./configure $OPTS
$PMAKE
make install
