#!/bin/bash

if [ ! -e /sw ]; then
echo 'Installing fink...  Please follow the directions...'
curl -s https://raw.githubusercontent.com/fink/scripts/master/srcinstaller/Install%20Fink.tool | /bin/bash
fi

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y install \
autoconf2.6 \
automake1.15-core \
bison \
cmake \
curl \
gettext-bin \
git \
libtool2 \
make \
pdftk \
rsync \
tmux \
vim \
wget \
xz \
\
bzip2-dev \
cairo \
openssl100-dev \
libevent2 \
libffi6-shlibs \
freetype \
libjpeg \
libncurses5-shlibs \
libpcre2 \
libpng16 \
readline6 \
sqlite3-dev \
uuid \
uuid-shlibs \
libwebp5 \
libxml2
