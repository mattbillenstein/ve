#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
sudo ucf --purge /boot/grub/menu.lst

sudo apt-get update
sudo apt-get -y --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

sudo apt-get -y install \
acpid \
atop \
autoconf \
automake \
bison \
build-essential \
cmake \
cowsay \
curl \
default-jre-headless \
dnsutils \
expect \
fortune \
g++ \
gcc \
gettext \
gfortran \
git-core \
libtool \
lsof \
make \
man-db \
ntp \
numactl \
pigz \
pdftk \
pkg-config \
psmisc \
python-dev \
rsync \
ssh \
strace \
swig \
tmux \
unzip \
vim \
wamerican \
wget \
xzdec \
xz-utils \
zip \
\
libatlas-base-dev \
libbz2-dev \
libcairo2-dev \
libcurl4-openssl-dev \
libevent-dev \
libffi-dev \
libfreetype6-dev \
libicu-dev \
libjpeg-dev \
libncurses5-dev \
libpcre3-dev \
libperl-dev \
libpng12-dev \
libreadline-dev \
libreadline6 \
libssl-dev \
libsqlite3-dev \
libuuid1 \
libwebp-dev \
libxml2-dev \
uuid-dev \
zlib1g-dev

sudo locale-gen en_US.UTF-8
