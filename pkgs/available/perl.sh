PERL_VERSION="5.18.2"

rm -fR ~/.cpan

getpkg http://www.cpan.org/src/5.0/perl-${PERL_VERSION}.tar.gz

tar -xzf perl-${PERL_VERSION}.tar.gz
cd perl-${PERL_VERSION}

./Configure -des -Dprefix=$VENV -Duseshrplib=true

$PMAKE
#make test
make install

curl https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm > $VENV/bin/cpanm
chmod 755 $VENV/bin/cpanm

echo yes | $VENV/bin/cpan local::lib
