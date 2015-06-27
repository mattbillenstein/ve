GOLANG_VERSION="1.4.2"
GOLANG_KERNEL="linux"
GOLANG_PLATFORM=""

# https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
# https://storage.googleapis.com/golang/go1.4.2.darwin-amd64-osx10.8.tar.gz

if [ "$MOS" == "OSX" ]; then
GOLANG_KERNEL="darwin"
GOLANG_PLATFORM="-osx10.8"
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-amd64${GOLANG_PLATFORM}"

getpkg https://storage.googleapis.com/golang/${NAME}.tar.gz
tar zxf ${NAME}.tar.gz

mv go $VENV/
