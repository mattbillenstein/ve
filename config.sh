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
elif [ -f /etc/pacman.conf ]; then
    OS="Arch"
    MOS="Arch"
    PROCS=$(grep -c '^processor' /proc/cpuinfo)
elif [ "$(lsb_release -si)" == "Ubuntu" ]; then
    ver="$(lsb_release -sr)"
    if [ "$ver" != "16.04" ] && [ "$ver" != "18.04" ]; then
        echo "It's recommended to run on an Ubuntu LTS release ($ver)-- do you want to continue?  (Ctrl-C aborts)"
        read foo
    fi
    OS="Ubuntu_$ver"
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
        curl -s -L --retry 2 --retry-delay 10 -o "$PKG_CACHE/$FILENAME" $URL
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
export CFLAGS=""
export CPPFLAGS="-I$VENV/include"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-L. -L$VENV/lib"
export LD_LIBRARY_PATH="$VENV/lib"
export PKG_CONFIG_PATH="$VENV/lib/pkgconfig"
