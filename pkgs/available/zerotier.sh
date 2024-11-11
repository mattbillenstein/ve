if [ "$MOS" != "MacOS" ]; then

ZEROTIER_VERSION="1.14.0"
ZEROTIER_SHA256SUM="7191623a81b0d1b552b9431e8864dd3420783ee518394ac1376cee6aaf033291"
getpkg https://github.com/zerotier/ZeroTierOne/archive/refs/tags/1.14.0.tar.gz $ZEROTIER_SHA256SUM
tar zxf ${ZEROTIER_VERSION}.tar.gz
cd ZeroTierOne-${ZEROTIER_VERSION}
$PMAKE

# make install puts stuff in /var, override
cp zerotier-one $VENV/bin/
ln -s zerotier-one $VENV/bin/zerotier-cli
ln -s zerotier-one $VENV/bin/zerotier-idtool

mkdir -p $VENV/share/man/man{1,8}
cat doc/zerotier-one.8 | gzip -9 > $VENV/share/man/man8/zerotier-one.8.gz
cat doc/zerotier-cli.1 | gzip -9 > $VENV/share/man/man1/zerotier-cli.1.gz
cat doc/zerotier-idtool.1 | gzip -9 > $VENV/share/man/man1/zerotier-idtool.1.gz

fi
