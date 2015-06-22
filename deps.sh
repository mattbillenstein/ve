#!/bin/bash -xv

set -e

source ./config.sh

sudo mkdir -p $LOG_DIR $RUN_DIR
sudo chown -R $USER:$GROUP $LOG_DIR $RUN_DIR

if [ "$MOS" == "OSX" ]; then

source os/osx/fink.sh

elif [ "$MOS" == "Ubuntu" ]; then

source os/ubuntu/apt.sh

sudo bash -c "echo $VENV/lib > /etc/ld.so.conf.d/venv.conf"
sudo ldconfig

else
echo "Error -- unsupported platform"
exit 1
fi
