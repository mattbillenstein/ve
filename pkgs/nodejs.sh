NODEJS_VERSION="0.12.7"

getpkg http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz
tar zxvf node-v${NODEJS_VERSION}.tar.gz
cd node-v${NODEJS_VERSION}/
./configure --prefix=$VENV
$PMAKE install

# install some random node pkgs...
npm install -g lodash
npm install -g bower
npm install -g gulp
npm install -g through2
npm install -g stylus
npm install -g uglify-js
npm install -g js-yaml
npm install -g cssmin
