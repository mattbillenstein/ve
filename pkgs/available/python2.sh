PYTHON_VERSION="2.7.15"

getpkg http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
CONFIGURE_OPTS="--enable-shared --with-system-expat --enable-optimizaations"
if [ "$MOS" != "OSX" ]; then
CONFIGURE_OPTS="$CONFIGURE_OPTS --enable-unicode=ucs4"
fi
./configure --prefix=$VENV $CONFIGURE_OPTS
$PMAKE
make install

cd $BUILD_DIR

getpkg https://bootstrap.pypa.io/get-pip.py
$VENV/bin/python ./get-pip.py

$VENV/bin/pip install --src $VENV/src -r ${SCRIPTPATH}/pkgs/available/python2-requirements.txt

$VENV/bin/python -c 'import numpy, scipy, pandas, sklearn'   # check that these actually work

$VENV/bin/python -m compileall -q -f $VENV || true
