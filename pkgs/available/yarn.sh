YARN_VERSION="1.21.1"
YARN_SHA256SUM="d1d9f4a0f16f5ed484e814afeb98f39b82d4728c6c8beaafb5abc99c02db6674"

rm -fR $VENV/opt/yarn $VENV/bin/yarn
getpkg https://github.com/yarnpkg/yarn/releases/download/v${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz $YARN_SHA256SUM
tar zxf yarn-v${YARN_VERSION}.tar.gz
mv yarn-v${YARN_VERSION} $VENV/opt/yarn
ln -s $VENV/opt/yarn/bin/yarn $VENV/bin/
ln -s $VENV/opt/yarn/bin/yarn.js $VENV/bin/
