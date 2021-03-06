#!/bin/bash

if [ ! -e /usr/local/bin/brew ]; then
echo 'Installing homebrew...'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
echo 'You have an existing Homebrew installation - if this is your first
bootstrap, I highly recommend you purge homebrew (sudo rm -fR /usr/local/*) and
restart this script...  (Enter to continue, Ctrl-C to abort)'
read _
fi

BREW="$(readlink /usr/local/bin/brew)"

# make sure we run as the user that installed brew
BREW_USER="$(ls -ld $BREW | awk '{print $3}')"
if [ "$BREW_USER" != "$USER" ]; then
BREW="sudo -i -u $BREW_USER $BREW"
fi

sudo chown -R $(id -u $BREW_USER):$(id -g $BREW_USER) /usr/local/* || true

sudo xcodebuild -license accept || true
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer || true

$BREW update
$BREW upgrade

$BREW install \
autoconf \
automake \
bzip2 \
cmake \
coreutils \
cowsay \
curl \
findutils \
fortune \
gawk \
gcc \
gettext \
git \
gnu-sed \
gnu-tar \
gzip \
jq \
libtool \
make \
openssl \
pkgconfig \
rsync \
tmux \
vim \
wget \
xz

# clang doesn't like arguments it doesn't use
export CFLAGS="-Qunused-arguments $CFLAGS"

#export CPPFLAGS="$CPPFLAGS -I/usr/local/include"
#export LDFLAGS="$LDFLAGS -L/usr/local/lib"

# brew keg only...
# brew info --json=v1 --installed | jq "map(select(.keg_only == true) | .name)"
#for pkg in bison bzip2 expat icu4c libffi ncurses openssl readline sqlite zlib; do
#export PATH="/usr/local/opt/$pkg/bin:$PATH"
#export LDFLAGS="$LDFLAGS -L/usr/local/opt/$pkg/lib"
#export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/$pkg/include"
#export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/$pkg/lib/pkgconfig"
#done

export PATH="/usr/local/opt/gettext/bin:$PATH"
