PYTHON_VERSION="2.7.10"

rm -fR Python-${PYTHON_VERSION}*
getpkg http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
#if [ "$MOS" != "OSX" ]; then
## readline fails to link on OSX
#sed -i -e 's/#readline/readline/' Modules/Setup.dist
#fi
./configure --prefix=$VENV --enable-shared
LDFLAGS="-L. -L$VENV/lib" $PMAKE
make install

# hack - fake we're in a virtualenv - pkgs seem to test sys.real_prefix to
# detect this.
cat > $VENV/lib/python2.7/sitecustomize.py <<EOF
import sys
sys.real_prefix = 'hackforvirtualenv'
EOF

cd $BUILD_DIR

getpkg https://raw.github.com/pypa/pip/master/contrib/get-pip.py
$VENV/bin/python ./get-pip.py

# le sign
curl -s http://curl.haxx.se/ca/cacert.pem > $VENV/lib/python2.7/site-packages/pip/_vendor/requests/cacert.pem
PIP="$VENV/bin/pip -cert cacert.pem"

# graphite-web hacks
sudo rm -fR /opt/graphite
sudo mkdir /opt/graphite
sudo chown $USER:$GROUP /opt/graphite

# some graphite deps first...
$PIP install 'twisted<=12.0'
$PIP install 'django<1.7'
$PIP install --allow-external pycairo --allow-unverified pycairo 'pycairo==1.8.8'
# WTF this module is broken
echo 'from _cairo import *' > $VENV/lib/python2.7/site-packages/cairo/__init__.py
$PIP install carbon
$PIP install django-tagging
$PIP install git+https://github.com/graphite-project/graphite-web.git
$PIP install pyparsing
$PIP install whisper

sudo mv /opt/graphite $VENV

$PIP install ansible
$PIP install arrow
$PIP install awscli
$PIP install babel
$PIP install bcrypt
$PIP install beanstalkc
$PIP install BeautifulSoup
$PIP install bleach
$PIP install boto
$PIP install coverage
$PIP install cython
$PIP install decorator
$PIP install dill
$PIP install dnspython
$PIP install fabric
$PIP install flask
$PIP install flask-assets
$PIP install Flask-Mako
$PIP install geoip2
$PIP install gevent
$PIP install git+https://github.com/abourget/gevent-socketio.git
$PIP install git+https://github.com/benoitc/gunicorn.git
$PIP install git+https://github.com/mattbillenstein/flask-classy.git
$PIP install git+https://github.com/mattbillenstein/gstatsd
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
LDFLAGS="$LDFLAGS -shared" $PIP install numpy
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
$PIP install scikit-learn
$PIP install scipy
$PIP install sendgrid
$PIP install setproctitle
$PIP install simplejson
$PIP install stripe
$PIP install unidecode
$PIP install webassets
$PIP install webtest
$PIP install werkzeug

$VENV/bin/python -m compileall -q -f $VENV || true
