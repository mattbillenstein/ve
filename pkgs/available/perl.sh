PERL_VERSION="5.36.0"
PERL_SHA256SUM="e26085af8ac396f62add8a533c3a0ea8c8497d836f0689347ac5abd7b7a4e00a"

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
