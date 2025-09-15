GOLANG_VERSION="1.23.3"

GOLANG_SHA256SUM="a0afb9744c00648bafb1b90b4aba5bdb86f424f02f9275399ce0c20b93a2c3a8"
if [ "$ARCH_AMD64_ARM64" == "arm64" ]; then
  GOLANG_SHA256SUM="1f7cbd7f668ea32a107ecd41b6488aaee1f5d77a66efd885b175494439d4e1ce"
fi

if [ "$MOS" == "MacOS" ]; then
  GOLANG_SHA256SUM="c7e024d5c0bc81845070f23598caf02f05b8ae88fd4ad2cd3e236ddbea833ad2"
  if [ "$ARCH_AMD64_ARM64" == "arm64" ]; then
    GOLANG_SHA256SUM="31e119fe9bde6e105407a32558d5b5fa6ca11e2bd17f8b7b2f8a06aba16a0632"
  fi
fi

NAME="go${GOLANG_VERSION}.${KERNEL}-${ARCH_AMD64_ARM64}"

getpkg https://go.dev/dl/${NAME}.tar.gz $GOLANG_SHA256SUM
tar zxf ${NAME}.tar.gz

rm -fR $VENV/opt/go
mkdir -p $VENV/opt

mv go $VENV/opt/

export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/golang"
export PATH="$GOROOT/bin:$PATH"
