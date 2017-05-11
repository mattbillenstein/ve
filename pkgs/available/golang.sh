GOLANG_VERSION="1.7.3"
GOLANG_KERNEL="linux"

# http://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
# http://storage.googleapis.com/golang/go1.5.1.darwin-amd64.tar.gz

if [ "$MOS" == "OSX" ]; then
GOLANG_KERNEL="darwin"
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-amd64"

getpkg http://storage.googleapis.com/golang/${NAME}.tar.gz
tar zxf ${NAME}.tar.gz

mv go $VENV/
