PIP_INSTALL="$VENV/bin/pip install --root=/opt/graphite"

# graphite-web hacks
sudo rm -fR /opt/graphite
sudo mkdir /opt/graphite
sudo chown $USER:$GROUP /opt/graphite

$PIP_INSTALL 'twisted<=12.0'
$PIP_INSTALL 'django<1.7'
$PIP_INSTALL --allow-external pycairo --allow-unverified pycairo 'pycairo==1.8.8'
# WTF this module is broken
#echo 'from _cairo import *' > $VENV/lib/python2.7/site-packages/cairo/__init__.py
$PIP_INSTALL carbon
$PIP_INSTALL django-tagging
$PIP_INSTALL git+https://github.com/graphite-project/graphite-web.git
$PIP_INSTALL pyparsing
$PIP_INSTALL whisper

sudo mv /opt/graphite $VENV
cd $VENV/graphite
mv opt/graphite/* .
rm -fR opt
mv ve/bin/* bin/
mv ve/conf/* conf/
mv ve/include .
mv ve/lib .
rm -fR ve storage examples
