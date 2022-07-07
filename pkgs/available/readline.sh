READLINE_VERSION="8.1.2"
READLINE_SHA256SUM="7589a2381a8419e68654a47623ce7dfcb756815c8fee726b98f90bf668af7bc6"

rm -fR readline*
getpkg https://ftp.gnu.org/gnu/readline/readline-${READLINE_VERSION}.tar.gz $READLINE_SHA256SUM
tar zxvf readline-${READLINE_VERSION}.tar.gz 
cd readline-${READLINE_VERSION}

./configure --prefix=$VENV --enable-multibyte
$PMAKE
make install
