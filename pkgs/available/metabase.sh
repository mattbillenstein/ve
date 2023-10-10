METABASE_VERSION="0.45.3"
METABASE_SHA256SUM="b7eedcba1bf1bf8843f66608aa976ec206353fb13ad8acb10471f9fe35d56968"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $METABASE_SHA256SUM

mv metabase.jar $VENV/opt/metabase/
