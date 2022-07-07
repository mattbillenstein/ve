PYTHON_VERSION="3.9.9"
PYTHON_SHA256SUM="2cc7b67c1f3f66c571acc42479cdf691d8ed6b47bee12c9b68430413a17a44ea"

getpkg https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz $PYTHON_SHA256SUM
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
LDFLAGS="-Wl,-rpath $VENV/lib" \
./configure --prefix=$VENV --enable-shared --with-system-expat # --enable-optimizations
$PMAKE
make install

cd $BUILD_DIR

export AIRFLOW_GPL_UNIDECODE=1  # hax for airflow dep license bs

$VENV/bin/pip3 install -U pip
$VENV/bin/pip3 install -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt --src $VENV/src
