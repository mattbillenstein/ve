MAXMIND_LICENSE_KEY="EbYgT3hZ3uxbHj0G"

rm -fR GeoLite2*
rm -fR $VENV/opt/geoip
mkdir -p $VENV/opt/geoip

SHA256SUM=$(curl -s "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=$MAXMIND_LICENSE_KEY&suffix=tar.gz.sha256" | awk '{print $1}')
getpkg "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=$MAXMIND_LICENSE_KEY&suffix=tar.gz" $SHA256SUM GeoLite2-City.tgz
tar zxf GeoLite2-City.tgz
cp GeoLite2-City_20*/GeoLite2-City.mmdb $VENV/opt/geoip/

SHA256SUM=$(curl -s "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City-CSV&license_key=$MAXMIND_LICENSE_KEY&suffix=zip.sha256" | awk '{print $1}')
getpkg "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City-CSV&license_key=$MAXMIND_LICENSE_KEY&suffix=zip" $SHA256SUM GeoLite2-City-CSV.zip
cp GeoLite2-City-CSV.zip $VENV/opt/geoip/
