# need to build from source to pick up https://github.com/nsqio/nsq/pull/935

#NSQ_VERSION="1.0.0-compat"
#
#NSQ_PLATFORM="linux"
#if [ "$MOS" == "OSX" ]; then
#NSQ_PLATFORM="darwin"
#fi
#
#getpkg https://s3.amazonaws.com/bitly-downloads/nsq/nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-amd64.go1.8.tar.gz
#tar zxf nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-amd64.go1.8.tar.gz
#mv nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-amd64.go1.8/bin/* $VENV/bin/

mkdir -p $GOPATH/src/github.com/nsqio
cd $GOPATH/src/github.com/nsqio
git clone https://github.com/nsqio/nsq.git
cd nsq
git checkout 2305c6fd2320e32442ac741c634791c21b8734b2

$VENV/opt/go/bin/dep ensure
PATH="$VENV/opt/go/bin:$PATH" make -j4
rm -f $VENV/bin/nsq* $VENV/bin/to_nsq
cp build/* $VENV/bin/
