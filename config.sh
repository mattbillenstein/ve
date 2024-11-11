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
    if [ "$ver" != "20.04" ] && [ "$ver" != "22.04" ] && [ "$ver" != "24.04" ]; then
        echo "It's recommended to run on an Ubuntu LTS release ($ver)-- do you want to continue?  (Ctrl-C aborts)"
        read _
    fi
    MOS="Ubuntu"
    PROCS=$(grep -c '^processor' /proc/cpuinfo)
fi

OS="$MOS-$MARCH"

PMAKE="nice -n 10 make -j $PROCS"

function getpkg() {
    URL=$1
    SHA256SUM=$2
    FILENAME=$3
    if [ "$FILENAME" == "" ]; then
      FILENAME=$(basename "$URL")
    fi

    mkdir -p $PKG_CACHE

    ETAG=$(curl -s -L --retry 2 --retry-delay 10 --head $URL | egrep -i '^etag:' | awk -F : '{print $2}' | tr -d '" \t\r\n$')
    if [ "$ETAG" == "" ]; then
      ETAG=$(curl -s -L --retry 2 --retry-delay 10 --head $URL | egrep -i '^content-length:' | awk -F : '{print $2}' | tr -d '" \t\r\n$')
    fi

    if [ ! -f "$PKG_CACHE/$FILENAME-$ETAG" ]; then
        curl -s -L --retry 2 --retry-delay 10 -o "$PKG_CACHE/$FILENAME-$ETAG" $URL
    fi

    if [ "$SHA256SUM" != "skip" ] && [ "$(openssl dgst -sha256 $PKG_CACHE/$FILENAME-$ETAG | awk '{print $NF}')" != "$SHA256SUM" ]; then
        echo "SHA256SUM mismatch $PKG_CACHE/$FILENAME-$ETAG $SHA256SUM"
        ls -l $PKG_CACHE/$FILENAME-$ETAG
        exit 1
    fi

    cp "$PKG_CACHE/$FILENAME-$ETAG" $BUILD_DIR/$FILENAME

    if [ "$ETAG" == "" ]; then
        rm "$PKG_CACHE/$FILENAME-$ETAG"
    fi
}

# might want to override these in config_local.sh
LOG_DIR="$DATA_DIR/log"
RUN_DIR="$DATA_DIR/run"

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

# customize here
source $SCRIPTPATH/config_local.sh

export PATH="$VENV/bin:$PATH"
export CFLAGS=""
export CPPFLAGS="-I$VENV/include"
export CXXFLAGS="$CFLAGS"
export RPATH_ARGS="-Wl,--rpath="
if [ "$MOS" == "MacOS" ]; then
  export RPATH_ARGS="-R"
fi
export LDFLAGS="-L. -L$VENV/lib ${RPATH_ARGS}$VENV/lib"
#export LD_LIBRARY_PATH="$VENV/lib"
export PKG_CONFIG_PATH="$VENV/lib/pkgconfig"

# convention re reproducable builds
export SOURCE_DATE_EPOCH=$(git -C $SCRIPTPATH log -1 --pretty=%ct)

if [ "$(which ccache)" != "" ]; then
  if [ "$MOS" == "MacOS" ]; then
    export PATH="$(brew --prefix)/opt/ccache/libexec:$PATH"
  else
    export PATH="/usr/lib/ccache:$PATH"
  fi
fi
