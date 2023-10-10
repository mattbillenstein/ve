PYTHON_VERSION="3.11.6"
PYTHON_SHA256SUM="c049bf317e877cbf9fce8c3af902436774ecef5249a29d10984ca3a37f7f4736"

getpkg https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz $PYTHON_SHA256SUM
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --with-system-expat --enable-optimizations
$PMAKE
make install

cd $BUILD_DIR

$VENV/bin/pip3 install -U pip
$VENV/bin/pip3 install -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt --src $VENV/src
