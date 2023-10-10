PERL_VERSION="5.38.0"
PERL_SHA256SUM="213ef58089d2f2c972ea353517dc60ec3656f050dcc027666e118b508423e517"

rm -fR ~/.cpan

getpkg http://www.cpan.org/src/5.0/perl-${PERL_VERSION}.tar.gz $PERL_SHA256SUM

tar -xzf perl-${PERL_VERSION}.tar.gz
cd perl-${PERL_VERSION}

./Configure -des -Dprefix=$VENV -Duseshrplib=true

$PMAKE
#make test
make install

curl https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm > $VENV/bin/cpanm
chmod 755 $VENV/bin/cpanm

echo yes | $VENV/bin/cpan local::lib
