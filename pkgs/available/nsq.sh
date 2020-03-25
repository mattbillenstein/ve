NSQ_VERSION="1.2.0"
NSQ_SHA256SUM="a469514f7305abe72e1d6b4a2ca256b7a55d7d0a86d4f2bb04fab7bf444603d6"
NSQ_GO="go1.12.9"

NSQ_PLATFORM="linux"
if [ "$MOS" == "MacOS" ]; then
NSQ_PLATFORM="darwin"
NSQ_SHA256SUM="6545f87ce1d558cc7a4aa63d1adccb6991b04104cb57e74f3774e3f535c079f8"
fi

NSQ_ARCH="$ARCH"
if [ "$NSQ_ARCH" == "x86_64" ]; then
NSQ_ARCH="amd64"
fi

NSQ_NAME="nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-${NSQ_ARCH}.${NSQ_GO}"

getpkg https://s3.amazonaws.com/bitly-downloads/nsq/${NSQ_NAME}.tar.gz $NSQ_SHA256SUM
tar zxf ${NSQ_NAME}.tar.gz
mv ${NSQ_NAME}/bin/* $VENV/bin/

## build from source in case we need to pick up some newer fixes...
#mkdir -p $GOPATH/src/github.com/nsqio
#cd $GOPATH/src/github.com/nsqio
#git clone https://github.com/nsqio/nsq.git
#cd nsq
#git checkout 'v1.1.0'
#
#$VENV/opt/go/bin/dep ensure
#PATH="$VENV/opt/go/bin:$PATH" make -j4
#rm -f $VENV/bin/nsq* $VENV/bin/to_nsq
#cp build/* $VENV/bin/
