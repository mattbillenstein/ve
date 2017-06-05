#!/bin/bash

if [ "$(which brew)" == "" ]; then
echo 'Installing homebrew...'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew install \
autoconf \
automake \
bison \
bzip2 \
cairo \
cmake \
coreutils \
curl \
file-formula \
findutils \
freetype \
gcc \
gdbm \
gettext \
git \
https://raw.githubusercontent.com/youtux/homebrew-binary/pdftk/pdftk.rb \
icu4c \
libevent \
libffi \
libjpeg \
libmagic \
libpcap \
libpng \
libtool \
libxml2 \
make \
ncurses \
openssl \
ossp-uuid \
pcre \
pixman \
pkgconfig \
readline \
rsync \
sqlite \
swig \
tmux \
vim \
webp \
wget \
xz
