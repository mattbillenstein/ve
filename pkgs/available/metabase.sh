METABASE_VERSION="0.45.0"
METABASE_SHA256SUM="b4ee9ea6f0a12e60d8d2495d2c6f863c0c0cb2cc7910e9a13358c99c61ad2014"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $METABASE_SHA256SUM

mv metabase.jar $VENV/opt/metabase/
