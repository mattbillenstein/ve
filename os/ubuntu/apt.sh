#!/bin/bash

unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
sudo ucf --purge /boot/grub/menu.lst

sudo apt-add-repository -y multiverse
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -fuy --force-yes -o Dpkg::Options::="--force-confnew" upgrade

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install \
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
locales \
lsof \
make \
man-db \
ntp \
numactl \
pigz \
pkg-config \
psmisc \
python3-dev \
rsync \
ssh \
strace \
swig \
texinfo \
tmux \
ufw \
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
libmaxminddb-dev \
libncurses5-dev \
libpango-1.0.0 \
libpangocairo-1.0-0 \
libpcap-dev \
libpcre3-dev \
libperl-dev \
libpng-dev \
libproj-dev \
libreadline-dev \
libreadline8 \
libsodium-dev \
libssl-dev \
libsqlite3-dev \
libuuid1 \
libwebp-dev \
libxml2-dev \
uuid-dev \
zlib1g-dev

sudo locale-gen en_US.UTF-8
