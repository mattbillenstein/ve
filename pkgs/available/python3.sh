PYTHON_VERSION="3.11.14"
PYTHON_SHA256SUM="563d2a1b2a5ba5d5409b5ecd05a0e1bf9b028cf3e6a6f0c87a5dc8dc3f2d9182"

getpkg https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz $PYTHON_SHA256SUM
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --enable-optimizations --with-lto
$PMAKE
make install

cd $BUILD_DIR

PIP_OPTS="--no-user --no-cache-dir --src $VENV/src"

$VENV/bin/pip3 install -U pip
$VENV/bin/pip install $PIP_OPTS -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt
