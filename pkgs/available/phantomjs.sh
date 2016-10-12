PHANTOMJS_VERSION="2.1.1"

if [ "$MOS" = "OSX" ]; then
getpkg https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-macosx.zip
unzip phantomjs-${PHANTOMJS_VERSION}-macosx.zip
mv phantomjs-${PHANTOMJS_VERSION}-macosx/bin/* $VENV/bin/
else
getpkg https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2
tar jxf phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2
mv phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/* $VENV/bin/
fi
