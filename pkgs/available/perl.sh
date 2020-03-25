PERL_VERSION="5.30.2"
PERL_SHA256SUM="66db7df8a91979eb576fac91743644da878244cf8ee152f02cd6f5cd7a731689"

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
