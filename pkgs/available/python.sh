PYTHON_VERSION="2.7.12"

getpkg http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
if [ "$MOS" == "OSX" ]; then
LIBS="-lgdbm_compat -lreadline"
fi
./configure --prefix=$VENV --enable-shared --with-system-expat --enable-unicode=ucs4
$PMAKE
make install

cd $BUILD_DIR

getpkg https://bootstrap.pypa.io/get-pip.py
$VENV/bin/python ./get-pip.py

$VENV/bin/pip install -r ${SCRIPTPATH}/pkgs/python-requirements-frozen.txt --src $BUILD_DIR

# hack to fix a bug in salt
sed -i -e 's/def chhome(name, home):/def chhome(name, home, persist=False):/' $VENV/lib/python2.7/site-packages/salt/modules/mac_user.py

$VENV/bin/python -m compileall -q -f $VENV || true
