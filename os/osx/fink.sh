#!/bin/bash

if [ ! -e /sw ]; then
echo 'Installing fink...  Please follow the directions...'
curl -s https://raw.githubusercontent.com/fink/scripts/master/srcinstaller/Install%20Fink.tool > /tmp/fink.sh
chmod 755 /tmp/fink.sh
/tmp/fink.sh
fi

source /sw/bin/init.sh

sudo fink -y selfupdate
sudo fink -y update
sudo fink -y update-all

sudo fink -y -b install \
autoconf2.6 \
automake1.15-core \
bison \
cmake \
coreutils \
coreutils-default \
curl \
gcc5 \
gettext-bin \
git \
libncurses5 \
libncurses5-shlibs \
libpcap1 \
libtool2 \
make \
openssl \
pdftk \
rsync \
swig \
tmux \
vim \
wget \
xz \
\
bzip2-dev \
cairo \
freetype \
gdbm4 \
gdbm4-shlibs \
libevent2 \
libffi6 \
libjpeg \
libpcap1-shlibs \
libpcre1 \
libpng16 \
libwebp5 \
libxml2 \
openssl100-dev \
openssl100-shlibs \
pixman \
readline6 \
sqlite3-dev \
uuid
