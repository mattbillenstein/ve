PYTHON_VERSION="3.6.0"

getpkg http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
if [ "$MOS" == "OSX" ]; then
LIBS="-lgdbm_compat -lreadline"
fi
./configure --prefix=$VENV --enable-shared --with-system-expat
$PMAKE
make install

cd $BUILD_DIR

$VENV/bin/pip3 install -r ${SCRIPTPATH}/pkgs/python3-requirements-frozen.txt --src $BUILD_DIR
