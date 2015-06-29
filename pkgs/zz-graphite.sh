# this bit is kinda hacky -- graphite has some particular app dependencies, so
# lets isolate it from the main venv a bit.

PIP_INSTALL="$VENV/bin/pip install --root=/opt/graphite"

# graphite-web hacks
sudo rm -fR /opt/graphite
sudo mkdir /opt/graphite
sudo chown $USER:$GROUP /opt/graphite

$PIP_INSTALL 'twisted<=12.0'
$PIP_INSTALL 'django<1.7'
$PIP_INSTALL --allow-external pycairo --allow-unverified pycairo 'pycairo==1.8.8'
$PIP_INSTALL carbon
$PIP_INSTALL django-tagging
$PIP_INSTALL git+https://github.com/graphite-project/graphite-web.git
$PIP_INSTALL pyparsing
$PIP_INSTALL whisper

# graphite-web installs to /opt -- move it to the venv
# sudo - /opt is not owned by us
sudo mv /opt/graphite $VENV

# --root expands out the full path, collapse it
mv $VENV/graphite/opt/graphite/* $VENV/graphite
rm -fR $VENV/graphite/opt
mv $VENV/graphite$VENV/bin/* $VENV/graphite/bin/
mv $VENV/graphite$VENV/conf/* $VENV/graphite/conf/
mv $VENV/graphite$VENV/include $VENV/graphite/
mv $VENV/graphite$VENV/lib $VENV/graphite/
rm -fR $VENV/graphite$VENV $VENV$VENV $VENV/graphite/storage $VENV/graphite/examples

# WTF this module is broken
echo 'from _cairo import *' > $VENV/graphite/lib/python2.7/site-packages/cairo/__init__.py
