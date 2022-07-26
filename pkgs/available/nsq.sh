NSQ_VERSION="1.2.1"
NSQ_SHA256SUM="28c261b68ee27a026495564c76798beab4fffef73c613476f3695da9f466bd41"
NSQ_GO="go1.16.6"

NSQ_PLATFORM="linux"
if [ "$MOS" == "MacOS" ]; then
  NSQ_PLATFORM="darwin"
  if [ "$MARCH" == "x86_64" ]; then
    NSQ_SHA256SUM="6afdce04c70a28ba871aa228618816631b2fa09663c4c1640c0c7bec6c9691c5"
  else
    NSQ_SHA256SUM="b80105c181c840f90d54fa054dddb88a823deb8da93a0bf734879d0d08b077fc"
  fi
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
