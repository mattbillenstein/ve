NSQ_VERSION="1.2.0"
NSQ_GO="go1.12.9"

NSQ_PLATFORM="linux"
if [ "$MOS" == "MacOS" ]; then
NSQ_PLATFORM="darwin"
fi

NSQ_ARCH="$ARCH"
if [ "$NSQ_ARCH" == "x86_64" ]; then
NSQ_ARCH="amd64"
fi

NSQ_NAME="nsq-${NSQ_VERSION}.${NSQ_PLATFORM}-${NSQ_ARCH}.${NSQ_GO}"

getpkg https://s3.amazonaws.com/bitly-downloads/nsq/${NSQ_NAME}.tar.gz
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
