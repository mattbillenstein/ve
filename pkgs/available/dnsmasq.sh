DNSMASQ_VERSION="2.85"
DNSMASQ_SHA256SUM="f36b93ecac9397c15f461de9b1689ee5a2ed6b5135db0085916233053ff3f886"

rm -fR dnsmasq-${DNSMASQ_VERSION}*

getpkg http://www.thekelleys.org.uk/dnsmasq/dnsmasq-${DNSMASQ_VERSION}.tar.gz $DNSMASQ_SHA256SUM
tar zxf dnsmasq-${DNSMASQ_VERSION}.tar.gz
cd dnsmasq-${DNSMASQ_VERSION}
$PMAKE PREFIX=$VENV
make PREFIX=$VENV install
