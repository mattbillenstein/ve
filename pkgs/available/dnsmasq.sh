DNSMASQ_VERSION="2.75"

rm -fR dnsmasq-${DNSMASQ_VERSION}*

getpkg http://www.thekelleys.org.uk/dnsmasq/dnsmasq-${DNSMASQ_VERSION}.tar.gz
tar zxf dnsmasq-${DNSMASQ_VERSION}.tar.gz
cd dnsmasq-${DNSMASQ_VERSION}
$PMAKE PREFIX=$VENV
make PREFIX=$VENV install
