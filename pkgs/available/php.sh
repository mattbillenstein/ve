PHP_VERSION="7.2.34"
PHP_SHA256SUM="8b2777c741e83f188d3ca6d8e98ece7264acafee86787298fae57e05d0dddc78"

getpkg https://www.php.net/distributions/php-${PHP_VERSION}.tar.gz $PHP_SHA256SUM
tar zxvf php-${PHP_VERSION}.tar.gz

cd php-${PHP_VERSION}
./configure --prefix=$VENV/opt/php7.2
$PMAKE
make install
