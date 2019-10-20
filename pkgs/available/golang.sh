GOLANG_VERSION="1.11.1"
GOLANG_KERNEL="linux"
if [ "$MOS" == "MacOS" ]; then
GOLANG_KERNEL="darwin"
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-amd64"

getpkg https://dl.google.com/go/${NAME}.tar.gz
tar zxf ${NAME}.tar.gz

rm -fR $VENV/opt/go
mkdir -p $VENV/opt

mv go $VENV/opt/

export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/golang"
