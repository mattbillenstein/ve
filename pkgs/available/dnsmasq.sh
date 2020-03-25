DNSMASQ_VERSION="2.80"
DNSMASQ_SHA256SUM="9e4a58f816ce0033ce383c549b7d4058ad9b823968d352d2b76614f83ea39adc"

rm -fR dnsmasq-${DNSMASQ_VERSION}*

getpkg http://www.thekelleys.org.uk/dnsmasq/dnsmasq-${DNSMASQ_VERSION}.tar.gz $DNSMASQ_SHA256SUM
tar zxf dnsmasq-${DNSMASQ_VERSION}.tar.gz
cd dnsmasq-${DNSMASQ_VERSION}
$PMAKE PREFIX=$VENV
make PREFIX=$VENV install
