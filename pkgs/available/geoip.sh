ACCOUNT_ID="624916"
LICENSE_KEY="EbYgT3hZ3uxbHj0G"

rm -fR GeoLite2*
rm -fR $VENV/opt/geoip
mkdir -p $VENV/opt/geoip

# https://download.maxmind.com/geoip/databases/GeoLite2-City/download?suffix=tar.gz.sha256
# https://download.maxmind.com/geoip/databases/GeoLite2-City/download?suffix=tar.gz

# https://download.maxmind.com/geoip/databases/GeoLite2-City-CSV/download?suffix=zip.sha256
# https://download.maxmind.com/geoip/databases/GeoLite2-City-CSV/download?suffix=zip

URL="https://download.maxmind.com/geoip/databases/GeoLite2-City/download?suffix=tar.gz"
FNAME="GeoLite2-City.tar.gz"
SHA256SUM="$(curl -s -J -L -u $ACCOUNT_ID:$LICENSE_KEY ${URL}.sha256 | awk '{print $1}')"
getpkg $URL $SHA256SUM $FNAME "-u $ACCOUNT_ID:$LICENSE_KEY"

tar zxf $FNAME

URL="https://download.maxmind.com/geoip/databases/GeoLite2-City-CSV/download?suffix=zip"
FNAME="GeoLite2-City-CSV.zip"
SHA256SUM="$(curl -s -J -L -u $ACCOUNT_ID:$LICENSE_KEY ${URL}.sha256 | awk '{print $1}')"
getpkg $URL $SHA256SUM $FNAME "-u $ACCOUNT_ID:$LICENSE_KEY"

unzip $FNAME

mv GeoLite2-City*/*.mmdb $VENV/opt/geoip/
mv GeoLite2-City*/GeoLite2-City-Blocks-*.csv $VENV/opt/geoip/
mv GeoLite2-City*/GeoLite2-City-Locations-en.csv $VENV/opt/geoip/
