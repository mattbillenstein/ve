GOLANG_VERSION="1.8.3"
GOLANG_KERNEL="linux"
if [ "$MOS" == "OSX" ]; then
GOLANG_KERNEL="darwin"
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-amd64"

getpkg https://dl.google.com/go/${NAME}.tar.gz
tar zxf ${NAME}.tar.gz

rm -fR $VENV/opt/go
mkdir -p $VENV/opt

mv go $VENV/opt/

# Dep - pkg management
getpkg https://github.com/golang/dep/releases/download/v0.4.1/dep-${GOLANG_KERNEL}-amd64 $VENV/opt/go/bin/dep
chmod 755 $VENV/opt/go/bin/dep

export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/golang"
