#!/bin/bash -xv

set -e

source ./config.sh

if [ "$MOS" == "OSX" ];then

# put our env hacks in .bashrc - sourced from .bash_profile
if ! grep -q 'source ~/.bashrc' ~/.bash_profile; then
cat >> ~/.bash_profile <<EOF
source ~/.bashrc
EOF
fi

# install using home brew
os/osx/homebrew.sh

elif [ "$MOS" == "Ubuntu" ]; then

os/ubuntu/apt.sh

sudo bash -c "echo $VENV/lib > /etc/ld.so.conf.d/venv.conf"
sudo ldconfig

else
echo "Error -- unsupported platform"
exit 1
fi
