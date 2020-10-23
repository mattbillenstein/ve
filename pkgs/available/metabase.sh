METABASE_VERSION="0.36.7"
METABASE_SHA256SUM="b213cb06b42cd2456bd955ff9c490a8206e7629211cc033043a54dc3946b57a8"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $METABASE_SHA256SUM

mv metabase.jar $VENV/opt/metabase/
