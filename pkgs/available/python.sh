PYTHON_VERSION="2.7.14"

getpkg http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --enable-shared --with-system-expat --enable-unicode=ucs4 --enable-optimizaations
$PMAKE
make install

cd $BUILD_DIR

getpkg https://bootstrap.pypa.io/get-pip.py
$VENV/bin/python ./get-pip.py

PIP_OPTS="--src $VENV/src" # --no-clean"

# numpy and friends are always problematic -- who on earth still thinks
# invoking a fortran compiler in 2017 is a good idea??
$VENV/bin/pip install $PIP_OPTS 'numpy==1.14.1'

if [ "$MOS" == "OSX" ]; then
CFLAGS="-arch i386 -arch x86_64" \
FFLAGS="-m32 -m64" \
LDFLAGS="-Wall -undefined dynamic_lookup -bundle -arch i386 -arch x86_64" \
$VENV/bin/pip install $PIP_OPTS 'scipy==1.0.0'
else
$VENV/bin/pip install $PIP_OPTS 'scipy==1.0.0'
fi

$VENV/bin/pip install $PIP_OPTS 'pandas==0.22.0'
$VENV/bin/pip install $PIP_OPTS 'scikit-learn==0.19.1'

$VENV/bin/python -c 'import numpy, scipy, pandas, sklearn'

$VENV/bin/pip install $PIP_OPTS -r ${SCRIPTPATH}/pkgs/python-requirements.txt

$VENV/bin/python -m compileall -q -f $VENV || true
