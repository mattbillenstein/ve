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

PIP_OPTS="--src $BUILD_DIR" # --no-clean"

$VENV/bin/pip install $PIP_OPTS -r ${SCRIPTPATH}/pkgs/python-requirements-frozen.txt

# patched requests urllib3
$VENV/bin/pip install $PIP_OPTS -U 'git+https://github.com/mattbillenstein/requests@524b43154553489bf60216acb9030ce5b36f7215'

# numpy and friends are always problematic -- who on earth still thinks
# invoking a fortran compiler in 2017 is a good idea??
$VENV/bin/pip install $PIP_OPTS 'numpy==1.12.0'

if [ "$MOS" == "OSX" ]; then
getpkg https://github.com/scipy/scipy/releases/download/v0.17.1/scipy-0.17.1.tar.gz
tar zxf scipy-0.17.1.tar.gz
cd scipy-0.17.1
CFLAGS="-arch i386 -arch x86_64" \
FFLAGS="-m32 -m64" \
LDFLAGS="-Wall -undefined dynamic_lookup -bundle -arch i386 -arch x86_64" \
$VENV/bin/python setup.py install --prefix=$VENV
cd $BUILD_DIR
else
$VENV/bin/pip install $PIP_OPTS 'scipy==0.17.1'
fi

$VENV/bin/pip install $PIP_OPTS 'scikit-learn==0.17.1'

$VENV/bin/python2 -c 'import numpy, scipy, sklearn'

# hack to fix a bug in salt
sed -i -e 's/def chhome(name, home):/def chhome(name, home, persist=False):/' $VENV/lib/python2.7/site-packages/salt/modules/mac_user.py
# hack dyld path on osx
sed -i -e 's:/usr/local/lib:/sw/lib:g' $VENV/lib/python2.7/ctypes/macholib/dyld.py

$VENV/bin/python -m compileall -q -f $VENV || true
