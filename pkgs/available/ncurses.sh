NCURSES_VERSION="6.4"
NCURSES_SHA256SUM="6931283d9ac87c5073f30b6290c4c75f21632bb4fc3603ac8100812bed248159"

rm -fR ncurses*
getpkg https://invisible-mirror.net/archives/ncurses/ncurses-${NCURSES_VERSION}.tar.gz $NCURSES_SHA256SUM
tar zxf ncurses-${NCURSES_VERSION}.tar.gz
cd ncurses-${NCURSES_VERSION}

./configure --prefix=$VENV --with-shared
$PMAKE
make install

make distclean
./configure --prefix=$VENV --with-shared --enable-widec
$PMAKE
make install
