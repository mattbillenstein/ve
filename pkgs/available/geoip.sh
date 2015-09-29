mkdir -p $VENV/geoip
cd $VENV/geoip
getpkg http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz $VENV/geoip/
gunzip GeoLite2-City.mmdb.gz
