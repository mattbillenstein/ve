METABASE_VERSION="0.53.8"
METABASE_SHA256SUM="39795c1a3db9737962d91d74e23369b9bbd02a04f62afd14c5fe33b1171e5358"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $METABASE_SHA256SUM

mv metabase.jar $VENV/opt/metabase/
