GOLANG_VERSION="1.18.6"
GOLANG_KERNEL="linux"
GOLANG_ARCH="amd64"
GOLANG_SHA256SUM="bb05f179a773fed60c6a454a24141aaa7e71edfd0f2d465ad610a3b8f1dc7fe8"

if [ "$MARCH" == "arm64" ]; then
  GOLANG_ARCH="$MARCH"
  GOLANG_SHA256SUM="838ffa94158125f16e4aa667ee4f6b499ea57e3e35a7e2517ad357ea06714691"
fi

if [ "$MOS" == "MacOS" ]; then
  GOLANG_KERNEL="darwin"
  GOLANG_SHA256SUM="05ef7855970fd9caf4e8d34fe73146cffcff740b80d00189d129302f13d22e6b"
  if [ "$MARCH" == "arm64" ]; then
    GOLANG_ARCH="arm64"
    GOLANG_SHA256SUM="bbe22ae2f9d284b0decd67baf82a8ec840f31ca312915af1afba8adfa764e23c"
  fi
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-${GOLANG_ARCH}"

getpkg https://go.dev/dl/${NAME}.tar.gz $GOLANG_SHA256SUM
tar zxf ${NAME}.tar.gz

rm -fR $VENV/opt/go
mkdir -p $VENV/opt

mv go $VENV/opt/

export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/golang"
export PATH="$GOROOT/bin:$PATH"
