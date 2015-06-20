#!/bin/bash -xv

USER=$(id -un)
GROUP=$(id -gn)

if [ "$USER" == "root" ]; then
echo 'Do not run as root, we modifiy your local environment...'
exit 1
fi

if [ "$(uname)" == "Darwin" ];then
    OS="OSX_10.X"
    MOS="OSX"
    PROCS="$(sysctl -n hw.ncpu)"

    VER="$(sw_vers -productVersion | sed -e 's/\.[0-9][0-9]*$//')"
    if [ "$VER" != "10.9" && "$VER" != "10.10" ]; then
        echo "Unsupported OSX version"
        exit 1
    fi
elif [ "$(lsb_release -si) $(lsb_release -sr)" == "Ubuntu 14.04" ]; then
    OS="Ubuntu_14.04"
    MOS="Ubuntu"
    PROCS=$(grep -c '^processor' /proc/cpuinfo)

    export DEBIAN_FRONTEND=noninteractive
fi

PMAKE="nice -n 10 make -j $PROCS"

ARCH="$(uname -m | sed -e 's/i686/i386/g')"
MARCH="$(uname -m)"

function getpkg() {
    URL=$1
    DST=$2
    if [ "$DST" == "" ]; then
        DST=$BUILD_DIR
    fi

    FILENAME=$(basename "$URL")

    mkdir -p $PKG_CACHE

    if [ ! -f "$PKG_CACHE/$FILENAME" ]; then
        wget --no-check-certificate -q -O "$PKG_CACHE/$FILENAME" $URL
    fi
    cp "$PKG_CACHE/$FILENAME" $DST
}

export PATH="$VENV/bin:$PATH"
export CFLAGS="-I$VENV/include"
export CPPFLAGS=$CFLAGS
export CXXFLAGS=$CFLAGS
export LDFLAGS="-L$VENV/lib"
export LD_LIBRARY_PATH="$VENV/lib"

# might want to override these in config_local.sh
LOG_DIR=/data/log
RUN_DIR=/data/run

source config_local.sh

if [ "$VENV" == "" ]; then
echo "Need a directory to build in yo..."
exit 1
fi
