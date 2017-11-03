NSQ_VERSION="1.0.0-compat"

NSQ_PLATFORM="linux"
if [ "$MOS" == "OSX" ]; then
NSQ_PLATFORM="darwin"
fi

getpkg https://s3.amazonaws.com/bitly-downloads/nsq/nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-amd64.go1.8.tar.gz
tar zxf nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-amd64.go1.8.tar.gz
mv nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-amd64.go1.8/bin/* $VENV/bin/
