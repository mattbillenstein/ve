PYTHON_VERSION="3.10.9"
PYTHON_SHA256SUM="4ccd7e46c8898f4c7862910a1703aa0e63525913a519abb2f55e26220a914d88"

getpkg https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz $PYTHON_SHA256SUM
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --with-system-expat --enable-optimizations
$PMAKE
make install

cd $BUILD_DIR

$VENV/bin/pip3 install -U pip
$VENV/bin/pip3 install -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt --src $VENV/src
