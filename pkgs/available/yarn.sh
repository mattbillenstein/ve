rm -fR $VENV/opt/yarn $VENV/bin/yarn
getpkg https://yarnpkg.com/latest.tar.gz
tar zxf latest.tar.gz
mv dist $VENV/opt/yarn
ln -s $VENV/opt/yarn/bin/yarn $VENV/bin/
