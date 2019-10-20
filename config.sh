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
    MOS="MacOS"
    PROCS="$(/usr/sbin/sysctl -n hw.ncpu)"
elif [ "$(lsb_release -si)" == "Ubuntu" ]; then
    ver="$(lsb_release -sr)"
    if [ "$ver" != "16.04" ] && [ "$ver" != "18.04" ]; then
        echo "It's recommended to run on an Ubuntu LTS release ($ver)-- do you want to continue?  (Ctrl-C aborts)"
        read foo
    fi
    MOS="Ubuntu"
    PROCS=$(grep -c '^processor' /proc/cpuinfo)
fi

OS="$MOS-$MARCH"

PMAKE="nice -n 10 make -j $PROCS"

function getpkg() {
    URL=$1
    FILENAME=$(basename "$URL")

    mkdir -p $PKG_CACHE

    ETAG=$(curl -s -L --retry 2 --retry-delay 10 --head $URL | egrep -i '^etag:' | awk -F : '{print $2}' | tr -d '" \t\r\n$')

    if [ ! -f "$PKG_CACHE/$FILENAME-$ETAG" ]; then
        curl -s -L --retry 2 --retry-delay 10 -o "$PKG_CACHE/$FILENAME-$ETAG" $URL
    fi

    cp "$PKG_CACHE/$FILENAME-$ETAG" $BUILD_DIR/$FILENAME

    if [ "$ETAG" == "" ]; then
        rm "$PKG_CACHE/$FILENAME-$ETAG"
    fi
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
