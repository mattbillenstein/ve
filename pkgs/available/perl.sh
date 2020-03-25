PERL_VERSION="5.30.2"
PERL_SHA256SUM="a469514f7305abe72e1d6b4a2ca256b7a55d7d0a86d4f2bb04fab7bf444603d6"

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
