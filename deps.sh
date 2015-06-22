#!/bin/bash -xv

set -e

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

source $SCRIPTPATH/config.sh

sudo mkdir -p $LOG_DIR $RUN_DIR
sudo chown -R $USER:$GROUP $LOG_DIR $RUN_DIR

if [ "$MOS" == "OSX" ]; then

source $SCRIPTPATH/os/osx/fink.sh

elif [ "$MOS" == "Ubuntu" ]; then

source $SCRIPTPATH/os/ubuntu/apt.sh

sudo bash -c "echo $VENV/lib > /etc/ld.so.conf.d/venv.conf"
sudo ldconfig

else
echo "Error -- unsupported platform"
exit 1
fi
