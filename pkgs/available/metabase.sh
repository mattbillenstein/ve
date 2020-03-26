METABASE_VERSION="0.34.3"
METABASE_SHA256SUM="cf8bd7fa27bae5337a80a22b65cabdd687a3514f636135052b66fd947fc3724f"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $METABASE_SHA256SUM

mv metabase.jar $VENV/opt/metabase/
