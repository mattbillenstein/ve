#!/bin/bash

if [ "$(which brew)" == "" ]; then
echo 'Installing homebrew...'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

brew install \
autoconf \
automake \
bison \
bzip2 \
cairo \
cmake \
coreutils \
curl \
expat \
file-formula \
findutils \
freetype \
gcc \
gdbm \
gettext \
git \
gnu-tar \
gzip \
https://raw.githubusercontent.com/youtux/homebrew-binary/pdftk/pdftk.rb \
icu4c \
jq \
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
xz \
zlib

# clang doesn't like arguments it doesn't use
export CFLAGS="-Qunused-arguments $CFLAGS"

export CPPFLAGS="$CPPFLAGS -I/usr/local/include"
export LDFLAGS="$LDFLAGS -L/usr/local/lib"

# brew keg only...
# brew info --json=v1 --installed | jq "map(select(.keg_only == true) | .name)"
for pkg in bison bzip2 expat icu4c libffi ncurses openssl readline sqlite zlib; do
export PATH="/usr/local/opt/$pkg/bin:$PATH"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/$pkg/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/$pkg/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/$pkg/lib/pkgconfig"
done
