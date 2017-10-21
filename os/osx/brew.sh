#!/bin/bash

if [ "$(which brew)" == "" ]; then
echo 'Installing homebrew...'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

BREW="$(which brew)"

# make sure we run as the user that installed brew
BREW_USER="$(ls -ld $BREW | awk '{print $3}')"
if [ "$BREW_USER" != "$USER" ]; then
BREW="sudo -i -u $BREW_USER $BREW"
fi

sudo xcodebuild -license accept || true

$BREW update
$BREW upgrade

$BREW install \
autoconf \
automake \
bison \
bzip2 \
cairo \
cmake \
coreutils \
cowsay \
curl \
expat \
file-formula \
findutils \
fortune \
freetype \
gawk \
gcc \
gdbm \
gettext \
git \
gnu-sed \
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
