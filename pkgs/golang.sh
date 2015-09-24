GOLANG_VERSION="1.5.1"
GOLANG_KERNEL="linux"

# https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
# https://storage.googleapis.com/golang/go1.5.1.darwin-amd64.tar.gz


if [ "$MOS" == "OSX" ]; then
GOLANG_KERNEL="darwin"
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-amd64"

getpkg https://storage.googleapis.com/golang/${NAME}.tar.gz
tar zxf ${NAME}.tar.gz

mv go $VENV/
