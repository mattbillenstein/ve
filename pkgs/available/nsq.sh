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

# build from source in case we need to pick up some newer fixes...
mkdir -p $GOPATH/src/github.com/nsqio
cd $GOPATH/src/github.com/nsqio
git clone https://github.com/nsqio/nsq.git
cd nsq
git checkout 'v1.1.0'

$VENV/opt/go/bin/dep ensure
PATH="$VENV/opt/go/bin:$PATH" make -j4
rm -f $VENV/bin/nsq* $VENV/bin/to_nsq
cp build/* $VENV/bin/
