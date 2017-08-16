
# subshell it real good -- install graphite in its own virtualenv, it requires
# some specific versions of some packages that might be considered old...

GRAPHITE_VERSION="GITHUB_HEAD"

(
$VENV/bin/virtualenv $VENV/opt/graphite
source $VENV/opt/graphite/bin/activate

# hmm, why is this hack needed for twisted??
export CFLAGS="-I$VENV/opt/graphite/include/python2.7"

$VENV/opt/graphite/bin/pip install git+https://github.com/benoitc/gunicorn.git
$VENV/opt/graphite/bin/pip install 'twisted<=12.0'
$VENV/opt/graphite/bin/pip install 'django<1.7'

#$VENV/opt/graphite/bin/pip install --allow-external pycairo --allow-unverified pycairo 'pycairo==1.8.8'

# 2016/02/24 -- cairographics.org seems down...
#$VENV/opt/graphite/bin/pip install http://cairographics.org/releases/pycairo-1.8.8.tar.gz
$VENV/opt/graphite/bin/pip install http://vazor.com/drop/pycairo-1.8.8.tar.gz
# WTF this module is broken
echo 'from _cairo import *' > $VENV/opt/graphite/lib/python2.7/site-packages/cairo/__init__.py

$VENV/opt/graphite/bin/pip install 'django-tagging==0.3.4'
$VENV/opt/graphite/bin/pip install pyparsing
$VENV/opt/graphite/bin/pip install pytz
$VENV/opt/graphite/bin/pip install whisper
$VENV/opt/graphite/bin/pip install carbon --install-option="--prefix=$VENV/opt/graphite" --install-option="--install-lib=$VENV/opt/graphite/lib"
$VENV/opt/graphite/bin/pip install git+https://github.com/graphite-project/graphite-web.git --install-option="--prefix=$VENV/opt/graphite" --install-option="--install-lib=$VENV/opt/graphite/webapp"

# HACK - local_settings import so we can stage this outside of the graphite
# package
sed -i -e 's/graphite\.local_settings/local_settings/g' $VENV/opt/graphite/webapp/graphite/settings.py
)
