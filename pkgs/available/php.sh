PHP_VERSION="8.5.11"
PHP_SHA256SUM="338630ba9450f0b938bef8d740162c61c33bf64a1b421c6333c01df8a9fdb0ab"

getpkg https://www.php.net/distributions/php-${PHP_VERSION}.tar.gz $PHP_SHA256SUM
tar zxf php-${PHP_VERSION}.tar.gz

cd php-${PHP_VERSION}
./configure --prefix=$VENV/opt/php${PHP_VERSION%.%}
$PMAKE
make install
