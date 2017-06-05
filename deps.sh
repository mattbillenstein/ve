#!/bin/bash -xv

set -e

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

source $SCRIPTPATH/config.sh

if [ "$MOS" == "OSX" ]; then

source $SCRIPTPATH/os/osx/brew.sh

elif [ "$MOS" == "Ubuntu" ]; then

source $SCRIPTPATH/os/ubuntu/apt.sh

sudo bash -c "echo $VENV/lib > /etc/ld.so.conf.d/venv.conf"
sudo ldconfig

elif [ "$MOS" == "Arch" ]; then

source $SCRIPTPATH/os/arch/pacman.sh

sudo bash -c "echo $VENV/lib > /etc/ld.so.conf.d/venv.conf"
sudo ldconfig

else
echo "Error -- unsupported platform"
exit 1
fi
