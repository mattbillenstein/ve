METABASE_VERSION="0.63.5"
METABASE_SHA256SUM="76bf5ecd2bd88307b25625d80267fc558375e66756a9c43d12c7522311d4acb4"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $METABASE_SHA256SUM

mv metabase.jar $VENV/opt/metabase/
