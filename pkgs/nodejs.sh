getpkg http://nodejs.org/dist/v0.10.31/node-v0.10.31.tar.gz
tar zxvf node-v0.10.31.tar.gz
cd node-v0.10.31/
./configure --prefix=/opt/venv && make -j4 && make install
npm install -g lodash
npm install -g bower
npm install -g gulp
npm install -g through2
npm install -g stylus
npm install -g uglify-js
npm install -g js-yaml
npm install -g cssmin

