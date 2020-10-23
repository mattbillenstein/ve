GOLANG_VERSION="1.15.3"
GOLANG_KERNEL="linux"
GOLANG_SHA256SUM="010a88df924a81ec21b293b5da8f9b11c176d27c0ee3962dc1738d2352d3c02d"
if [ "$MOS" == "MacOS" ]; then
GOLANG_KERNEL="darwin"
GOLANG_SHA256SUM="2e045043a28a2834e10edeb64c0cffd080a3525016fab1898d5624b57312a698"
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-amd64"

getpkg https://golang.org/dl/${NAME}.tar.gz $GOLANG_SHA256SUM
tar zxf ${NAME}.tar.gz

rm -fR $VENV/opt/go
mkdir -p $VENV/opt

mv go $VENV/opt/

export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/golang"
