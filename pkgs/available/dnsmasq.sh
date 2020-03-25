DNSMASQ_VERSION="2.80"
DNSMASQ_SHA256SUM="a"

rm -fR dnsmasq-${DNSMASQ_VERSION}*

getpkg http://www.thekelleys.org.uk/dnsmasq/dnsmasq-${DNSMASQ_VERSION}.tar.gz $DNSMASQ_SHA256SUM
tar zxf dnsmasq-${DNSMASQ_VERSION}.tar.gz
cd dnsmasq-${DNSMASQ_VERSION}
$PMAKE PREFIX=$VENV
make PREFIX=$VENV install
