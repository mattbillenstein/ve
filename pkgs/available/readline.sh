READLINE_VERSION="8.0"
READLINE_SHA256SUM="e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461"

rm -fR readline*
getpkg https://ftp.gnu.org/gnu/readline/readline-${READLINE_VERSION}.tar.gz $READLINE_SHA256SUM
tar zxvf readline-${READLINE_VERSION}.tar.gz 
cd readline-${READLINE_VERSION}

./configure --prefix=$VENV --enable-multibyte
$PMAKE
make install
