rm -fR $VENV/yarn $VENV/bin/yarn
getpkg https://yarnpkg.com/latest.tar.gz
tar zxvf latest.tar.gz
mv dist $VENV/yarn
ln -s $VENV/yarn/bin/yarn $VENV/bin/
