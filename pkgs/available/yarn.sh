YARN_VERSION="1.9.4"

rm -fR $VENV/opt/yarn $VENV/bin/yarn
getpkg https://github.com/yarnpkg/yarn/releases/download/v${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz
tar zxf yarn-v${YARN_VERSION}.tar.gz
mv yarn-v${YARN_VERSION} $VENV/opt/yarn
ln -s $VENV/opt/yarn/bin/yarn $VENV/bin/
