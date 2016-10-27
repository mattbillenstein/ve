PYTHON_VERSION="2.7.12"

getpkg http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
if [ "$MOS" == "OSX" ]; then
LIBS="-lgdbm_compat -lreadline"
fi
./configure --prefix=$VENV --enable-shared --with-system-expat
$PMAKE
make install

# hack - fake we're in a virtualenv - pkgs seem to test sys.real_prefix to
# detect this.
cat > $VENV/lib/python2.7/sitecustomize.py <<EOF
import sys
sys.real_prefix = 'hackforvirtualenv'
EOF

cd $BUILD_DIR

getpkg https://bootstrap.pypa.io/get-pip.py
$VENV/bin/python ./get-pip.py

$VENV/bin/pip install -r ${SCRIPTPATH}/pkgs/python-requirements-frozen.txt --src $BUILD_DIR

# hack to fix a bug in salt
sed -i -e 's/def chhome(name, home):/def chhome(name, home, persist=False):/' $VENV/lib/python2.7/site-packages/salt/modules/mac_user.py

# hack to remove annoying warning in distutils
sed -i -e 's/warnings.warn(/tuple(/g' $VENV/lib/python2.7/distutils/__init__.py

$VENV/bin/python -m compileall -q -f $VENV || true
