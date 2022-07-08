METABASE_VERSION="0.43.4"
METABASE_SHA256SUM="c89644d013eced830fc02d1169b88708fc2105089b356f1c988875b05882c189"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $METABASE_SHA256SUM

mv metabase.jar $VENV/opt/metabase/
