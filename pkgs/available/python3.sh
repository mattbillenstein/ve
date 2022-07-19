PYTHON_VERSION="3.9.13"
PYTHON_SHA256SUM="829b0d26072a44689a6b0810f5b4a3933ee2a0b8a4bfc99d7c5893ffd4f97c44"

getpkg https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz $PYTHON_SHA256SUM
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --with-system-expat # --enable-optimizations
$PMAKE
make install

cd $BUILD_DIR

$VENV/bin/pip3 install -U pip
$VENV/bin/pip3 install -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt --src $VENV/src
