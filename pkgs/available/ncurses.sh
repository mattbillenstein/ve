NCURSES_VERSION="6.2"
NCURSES_SHA256SUM="30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d"

rm -fR ncurses*
getpkg https://invisible-mirror.net/archives/ncurses/ncurses-${NCURSES_VERSION}.tar.gz $NCURSES_SHA256SUM
tar zxvf ncurses-${NCURSES_VERSION}.tar.gz 
cd ncurses-${NCURSES_VERSION}

./configure --prefix=$VENV --with-shared
$PMAKE
make install
