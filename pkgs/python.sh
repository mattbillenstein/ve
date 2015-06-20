PYTHON_VERSION="2.7.10"

rm -fR Python-${PYTHON_VERSION}*
getpkg http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
#if [ "$MOS" != "OSX" ]; then
## readline fails to link on OSX
#sed -i -e 's/#readline/readline/' Modules/Setup.dist
#fi
./configure --prefix=$VENV
$PMAKE
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

# graphite-web hacks
sudo rm -fR /opt/graphite
sudo mkdir /opt/graphite
sudo chown $USER:$GROUP /opt/graphite

# some graphite deps first...
pip install 'twisted<=12.0'
pip install 'django<1.7'
pip install --allow-external pycairo --allow-unverified pycairo 'pycairo==1.8.8'
# WTF this module is broken
echo 'from _cairo import *' > $VENV/lib/python2.7/site-packages/cairo/__init__.py
pip install carbon
pip install django-tagging
pip install git+https://github.com/graphite-project/graphite-web.git
pip install pyparsing
pip install whisper

sudo mv /opt/graphite $VENV

pip install ansible
pip install arrow
pip install awscli
pip install babel
pip install bcrypt
pip install beanstalkc
pip install BeautifulSoup
pip install bleach
pip install boto
pip install coverage
pip install cython
pip install decorator
pip install dill
pip install dnspython
pip install fabric
pip install flask
pip install flask-assets
pip install Flask-Mako
pip install geoip2
pip install gevent
pip install git+https://github.com/abourget/gevent-socketio.git
pip install git+https://github.com/benoitc/gunicorn.git
pip install git+https://github.com/mattbillenstein/flask-classy.git
pip install git+https://github.com/mattbillenstein/gstatsd
pip install greenlet
pip install gsutil
pip install hiredis
pip install html5lib
pip install ipdb
pip install ipython
pip install linode-python
pip install lockfile
pip install mock
pip install nose
pip install nose-parallel
#pip install numpy
pip install oauth2
pip install objgraph
pip install pillow
pip install psutil
pip install psycopg2
pip install PyJWT
pip install pylint
pip install pymysql
pip install PyPDF2
pip install pytz
pip install raven
pip install redis
pip install requests
pip install salt
#pip install scikit-learn
#pip install scipy
pip install sendgrid
pip install setproctitle
pip install simplejson
pip install stripe
pip install unidecode
pip install webassets
pip install webtest
pip install werkzeug

$VENV/bin/python -m compileall -q -f $VENV || true
