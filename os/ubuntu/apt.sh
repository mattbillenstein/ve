#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
sudo ucf --purge /boot/grub/menu.lst

sudo apt-add-repository multiverse
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -fuy --force-yes -o Dpkg::Options::="--force-confnew" upgrade

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
jq \
libtool \
lsof \
make \
man-db \
ntp \
numactl \
pigz \
pkg-config \
psmisc \
python-dev \
rsync \
ssh \
strace \
swig \
texinfo \
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
libgdal-dev \
libgeos-dev \
libgnutls28-dev \
libicu-dev \
libjpeg-dev \
libjson-c-dev \
libncurses5-dev \
libpango-1.0.0 \
libpangocairo-1.0-0 \
libpcap-dev \
libpcre3-dev \
libperl-dev \
libproj-dev \
libreadline-dev \
libsodium-dev \
libssl-dev \
libsqlite3-dev \
libuuid1 \
libwebp-dev \
libxml2-dev \
uuid-dev \
zlib1g-dev

if [ "$OS" == "Ubuntu_16.04" ]; then
sudo apt-get -y install \
libpng12-dev \
libreadline6
else
# 18.04
sudo apt-get -y install \
libpng-dev \
libreadline7
fi

sudo locale-gen en_US.UTF-8
