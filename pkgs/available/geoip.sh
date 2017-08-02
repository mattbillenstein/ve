rm -fR $VENV/geoip
mkdir -p $VENV/geoip
getpkg http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz $VENV/geoip/
gunzip $VENV/geoip/GeoLite2-City.mmdb.gz
