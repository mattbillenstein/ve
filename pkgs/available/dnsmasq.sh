DNSMASQ_VERSION="2.93"
DNSMASQ_SHA256SUM="cc967771abdafeb43d10db18932d6b59fd4bed2c69c22acf8cb96aff6920d55f"

rm -fR dnsmasq-${DNSMASQ_VERSION}*

getpkg http://dnsmasq.org/dnsmasq-${DNSMASQ_VERSION}.tar.gz $DNSMASQ_SHA256SUM
tar zxf dnsmasq-${DNSMASQ_VERSION}.tar.gz
cd dnsmasq-${DNSMASQ_VERSION}
$PMAKE PREFIX=$VENV
make PREFIX=$VENV install
