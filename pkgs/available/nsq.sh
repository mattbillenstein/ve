NSQ_VERSION="0.3.7"

NSQ_PLATFORM="linux"
if [ "$MOS" == "OSX" ]; then
NSQ_PLATFORM="darwin"
fi

getpkg https://s3.amazonaws.com/bitly-downloads/nsq/nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-amd64.go1.6.tar.gz
tar zxf nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-amd64.go1.6.tar.gz
mv nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-amd64.go1.6/bin/* $VENV/bin/
