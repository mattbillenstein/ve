
# subshell it real good -- install graphite in its own virtualenv, it requires
# some specific versions of some packages that might be considered old...

GRAPHITE_VERSION="GITHUB_HEAD"

(
$VENV/bin/virtualenv $VENV/graphite
source $VENV/graphite/bin/activate

$VENV/graphite/bin/pip install git+https://github.com/benoitc/gunicorn.git
$VENV/graphite/bin/pip install 'twisted<=12.0'
$VENV/graphite/bin/pip install 'django<1.7'

$VENV/graphite/bin/pip install --allow-external pycairo --allow-unverified pycairo 'pycairo==1.8.8'
# WTF this module is broken
echo 'from _cairo import *' > $VENV/graphite/lib/python2.7/site-packages/cairo/__init__.py

$VENV/graphite/bin/pip install 'django-tagging==0.3.4'
$VENV/graphite/bin/pip install pyparsing
$VENV/graphite/bin/pip install pytz
$VENV/graphite/bin/pip install whisper
$VENV/graphite/bin/pip install carbon --install-option="--prefix=$VENV/graphite" --install-option="--install-lib=$VENV/graphite/lib"
$VENV/graphite/bin/pip install git+https://github.com/graphite-project/graphite-web.git --install-option="--prefix=$VENV/graphite" --install-option="--install-lib=$VENV/graphite/webapp"

# HACK - local_settings import so we can stage this outside of the graphite
# package
sed -i -e 's/graphite\.local_settings/local_settings/g' $VENV/graphite/webapp/graphite/settings.py
)
