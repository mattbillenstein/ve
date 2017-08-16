rm -fR $VENV/opt/geoip
mkdir -p $VENV/opt/geoip
getpkg http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz $VENV/opt/geoip/
gunzip $VENV/opt/geoip/GeoLite2-City.mmdb.gz
