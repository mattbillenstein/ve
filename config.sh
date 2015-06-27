#!/bin/bash -xv

USER=$(id -un)
GROUP=$(id -gn)

if [ "$USER" == "root" ]; then
echo 'Do not run as root, we modifiy your local environment...'
exit 1
fi

ARCH="$(uname -m | sed -e 's/i686/i386/g')"
MARCH="$(uname -m)"

if [ "$(uname)" == "Darwin" ];then
    OS="OSX_10.X"
    MOS="OSX"
    PROCS="$(sysctl -n hw.ncpu)"
elif [ "$(lsb_release -si) $(lsb_release -sr)" == "Ubuntu 14.04" ]; then
    OS="Ubuntu_14.04"
    MOS="Ubuntu"
    PROCS=$(grep -c '^processor' /proc/cpuinfo)
fi

PMAKE="nice -n 10 make -j $PROCS"

function getpkg() {
    URL=$1
    DST=$2
    if [ "$DST" == "" ]; then
        DST=$BUILD_DIR
    fi

    FILENAME=$(basename "$URL")

    mkdir -p $PKG_CACHE

    if [ ! -f "$PKG_CACHE/$FILENAME" ]; then
        curl -s -o "$PKG_CACHE/$FILENAME" $URL
    fi
    cp "$PKG_CACHE/$FILENAME" $DST
}

# might want to override these in config_local.sh
LOG_DIR=/data/log
RUN_DIR=/data/run

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

# customize here
source $SCRIPTPATH/config_local.sh

export PATH="$VENV/bin:$PATH"
export CFLAGS="-I$VENV/include -I/sw/include"
export CPPFLAGS=$CFLAGS
export CXXFLAGS=$CFLAGS
export LDFLAGS="-L. -L$VENV/lib -L/sw/lib"
export LD_LIBRARY_PATH="$VENV/lib"

export DEBIAN_FRONTEND=noninteractive
