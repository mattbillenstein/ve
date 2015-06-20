getpkg https://github.com/kr/beanstalkd/archive/v1.10.tar.gz
tar zxvf v1.10.tar.gz
cd beanstalkd-1.10
$PMAKE CFLAGS=-O2
make install PREFIX=$VENV
