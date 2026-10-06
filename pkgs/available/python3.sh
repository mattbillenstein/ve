PYTHON_VERSION="3.14.8"
PYTHON_SHA256SUM="a65b20a728f169f4e66ae143f40b1bd3d33c38d770251663f627c9767b79b210"

getpkg https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz $PYTHON_SHA256SUM
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --enable-optimizations #--with-lto
$PMAKE
make install

cd $BUILD_DIR

PIP_OPTS="--no-user --no-cache-dir --src $VENV/src"

$VENV/bin/pip3 install -U pip
$VENV/bin/pip install $PIP_OPTS -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt
