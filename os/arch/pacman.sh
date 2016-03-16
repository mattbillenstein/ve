#!/bin/bash

#pdftk \
#wamerican \
#xzdec \
#libbz2-dev \
#libcairo2-dev \
#libcurl4-openssl-dev \
#libfreetype6-dev \
#libuuid1 \

sudo pacman --sync --needed --noconfirm \
acpid \
atop \
autoconf \
automake \
base-devel \
bison \
bzip2 \
cmake \
curl \
jre7-openjdk-headless \
bind-tools \
expect \
gcc \
gettext \
gcc-fortran \
git \
libtool \
lsof \
make \
man-db \
ntp \
numactl \
patch \
pigz \
pkg-config \
psmisc \
rsync \
strace \
swig \
tmux \
openssh \
unzip \
vim \
wget \
xz \
zip \
\
atlas-lapack-base \
cairo \
libevent \
libffi \
freetype2 \
libjpeg-turbo \
ncurses \
pcre \
libpng \
readline \
openssl \
sqlite \
libutil-linux \
libwebp \
libxml2 \
zlib

#rm -fR ncurses5-compat-libs*
#wget https://aur.archlinux.org/cgit/aur.git/snapshot/ncurses5-compat-libs.tar.gz
#tar zxf ncurses5-compat-libs.tar.gz
#cd ncurses5-compat-libs
#makepkg --skippgpcheck --noconfirm -si
#cd -
#cd /usr/lib
#sudo ln -s libncurses.so.5 libtinfo.so.5
#cd -

sudo locale-gen en_US.UTF-8
