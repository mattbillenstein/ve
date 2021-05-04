PYTHON_VERSION="3.8.10"
PYTHON_SHA256SUM="b37ac74d2cbad2590e7cd0dd2b3826c29afe89a734090a87bf8c03c45066cb65"

getpkg https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz $PYTHON_SHA256SUM
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --enable-shared --with-system-expat # --enable-optimizations
$PMAKE
make install

cd $BUILD_DIR

export AIRFLOW_GPL_UNIDECODE=1  # hax for airflow dep license bs

$VENV/bin/pip3 install -U pip
$VENV/bin/pip3 install -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt --src $VENV/src
