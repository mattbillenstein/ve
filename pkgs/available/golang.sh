GOLANG_VERSION="1.15.3"
GOLANG_KERNEL="linux"
GOLANG_SHA256SUM="010a88df924a81ec21b293b5da8f9b11c176d27c0ee3962dc1738d2352d3c02d"
if [ "$MOS" == "MacOS" ]; then
GOLANG_KERNEL="darwin"
GOLANG_SHA256SUM="d9fedc1f579fa60ee9efffdeed718d9a1a40f02ca1cb8640d8d01d7f472d4a56"
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-amd64"

getpkg https://golang.org/dl/${NAME}.tar.gz $GOLANG_SHA256SUM
tar zxf ${NAME}.tar.gz

rm -fR $VENV/opt/go
mkdir -p $VENV/opt

mv go $VENV/opt/

export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/golang"
