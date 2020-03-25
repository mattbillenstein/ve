GOLANG_VERSION="1.12.9"
GOLANG_KERNEL="linux"
GOLANG_SHA256SUM="ac2a6efcc1f5ec8bdc0db0a988bb1d301d64b6d61b7e8d9e42f662fbb75a2b9b"
if [ "$MOS" == "MacOS" ]; then
GOLANG_KERNEL="darwin"
GOLANG_SHA256SUM="4f189102b15de0be1852d03a764acb7ac5ea2c67672a6ad3a340bd18d0e04bb4"
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-amd64"

getpkg https://dl.google.com/go/${NAME}.tar.gz $GOLANG_SHA256SUM
tar zxf ${NAME}.tar.gz

rm -fR $VENV/opt/go
mkdir -p $VENV/opt

mv go $VENV/opt/

export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/golang"
