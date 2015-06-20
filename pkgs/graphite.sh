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

mv /opt/graphite /opt/venv/

ln -s /opt/etc/graphite/local_settings.py /opt/venv/graphite/webapp/graphite/

