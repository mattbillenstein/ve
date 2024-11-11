METABASE_VERSION="0.49.9"
METABASE_SHA256SUM="d5052b5d8a4cbe7fc69bc963985e4c60a15108843fbf7be9a0c24425c491daf2"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $METABASE_SHA256SUM

mv metabase.jar $VENV/opt/metabase/
