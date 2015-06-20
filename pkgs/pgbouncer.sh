getpkg http://pgfoundry.org/frs/download.php/3393/pgbouncer-1.5.4.tar.gz
tar zxvf pgbouncer-1.5.4.tar.gz
cd pgbouncer-1.5.4
./configure --prefix=$VENV
$PMAKE
make install

