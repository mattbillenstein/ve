PYTHON_VERSION="2.7.10"

getpkg http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
if [ "$MOS" == "OSX" ]; then
LIBS="-lgdbm_compat"
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

PIP="$VENV/bin/pip --trusted-host=pypi.python.org"

$PIP install 'ansible<2.0'
$PIP install arrow
$PIP install awscli
$PIP install babel
$PIP install baker
$PIP install bcrypt
$PIP install beanstalkc
$PIP install BeautifulSoup
$PIP install bleach
$PIP install boto
$PIP install boto3
$PIP install certifi
$PIP install coverage
$PIP install cython
$PIP install decorator
$PIP install dill
$PIP install dnspython
$PIP install docutils
$PIP install fabric
$PIP install flask
$PIP install flask-assets
$PIP install Flask-Mako
$PIP install geoip2
CFLAGS="-std=c99 $CFLAGS" $PIP install gevent

$PIP install versiontools  # ssl cert validation fail when installed in gevent-socketio under OSX...
$PIP install git+https://github.com/abourget/gevent-socketio.git

$PIP install git+https://github.com/benoitc/gunicorn.git
$PIP install git+https://github.com/mattbillenstein/flask-classy.git
$PIP install git+https://github.com/mattbillenstein/gstatsd
$PIP install gitpython
$PIP install greenlet
$PIP install gsutil
$PIP install hiredis
$PIP install html5lib
$PIP install ipdb
$PIP install ipython
$PIP install linode-python
$PIP install lockfile
$PIP install mock
$PIP install nose
$PIP install nose-parallel
(unset CFLAGS; unset CXXFLAGS; unset LDFLAGS; $PIP install numpy)
$PIP install oauth2
$PIP install objgraph
$PIP install pillow
$PIP install psutil
$PIP install psycopg2
$PIP install PyJWT
$PIP install pylint
$PIP install pymysql
$PIP install PyPDF2
$PIP install pytz
$PIP install raven
$PIP install redis
$PIP install requests
$PIP install salt
$PIP install saws
# scipy defines these - can't override them
(unset CFLAGS; unset CXXFLAGS; unset LDFLAGS; $PIP install scipy)
$PIP install scikit-learn
$PIP install sendgrid
$PIP install setproctitle
$PIP install simplejson
$PIP install stripe
# more features being put into github...
#$PIP install supervisor
$PIP install git+https://github.com/Supervisor/supervisor.git
$PIP install supervisor-wildcards
$PIP install unidecode
$PIP install virtualenv
$PIP install webassets
$PIP install webtest
$PIP install werkzeug

$VENV/bin/python -m compileall -q -f $VENV || true
