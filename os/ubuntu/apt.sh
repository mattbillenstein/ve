#!/bin/bash

APT_GET='sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o DPkg::Lock::Timeout=120 -o Dpkg::Options::=--force-confnew'
INSTALL='--fix-broken --auto-remove install'
UPGRADE='--with-new-pkgs upgrade'

if [ -e /etc/needrestart/conf.d ]; then
  sudo tee /etc/needrestart/conf.d/10-$SYSTEMD_UNIT.conf <<EOF
\$nrconf{override_rc}{qr(^$SYSTEMD_UNIT)} = 0;
EOF
fi

unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
sudo ucf --purge /boot/grub/menu.lst

$APT_GET update
$APT_GET $INSTALL software-properties-common apt-transport-https ca-certificates gnupg curl

if [ "$BUILD_DIR" != "" ]; then
  $APT_GET $INSTALL ccache
fi

sudo apt-add-repository -y multiverse

$APT_GET update
$APT_GET $UPGRADE

$APT_GET $INSTALL \
acpid \
apt-transport-https \
atop \
autoconf \
automake \
bison \
build-essential \
ca-certificates \
cargo \
cmake \
cowsay \
curl \
default-jre-headless \
dnsutils \
expect \
ffmpeg \
fortune \
g++ \
gcc \
gettext \
gfortran \
git \
git-lfs \
gnupg \
jq \
libtool \
locales \
lsof \
make \
man-db \
ntp \
numactl \
patchelf \
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
libegl1 \
libde265-dev \
libevent-dev \
libffi-dev \
libfreetype6-dev \
libgdal-dev \
libgeos-dev \
libgnutls28-dev \
libicu-dev \
libjpeg-dev \
libjson-c-dev \
liblwp-useragent-determined-perl \
liblzma-dev \
libmaxminddb-dev \
libncurses5-dev \
libncursesw5-dev \
libpango-1.0.0 \
libpangocairo-1.0-0 \
libpcap-dev \
libpcre3-dev \
libperl-dev \
libpng-dev \
libproj-dev \
libreadline8 \
libreadline-dev \
libsodium-dev \
libsqlite3-dev \
libssl-dev \
libuuid1 \
libwebp-dev \
libx265-dev \
libxml2-dev \
libxmlsec1-dev \
libyaml-dev \
tk-dev \
uuid-dev \
zlib1g-dev

sudo locale-gen en_US.UTF-8
