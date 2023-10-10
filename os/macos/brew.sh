#!/bin/bash

# intel currently installs to /usr/local, arm64 to $BREW_PREFIX
BREW_PREFIX="/usr/local"
if [ "$MARCH" == "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
fi

if [ ! -e $BREW_PREFIX/bin/brew ]; then
  echo 'Installing homebrew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo 'You have an existing Homebrew installation - if this is your first
bootstrap, I highly recommend you purge homebrew (sudo rm -fR $BREW_PREFIX) and
restart this script...  (Enter to continue, Ctrl-C to abort)'
#  read _
fi

BREW="$(readlink -f $BREW_PREFIX/bin/brew)"

# make sure we run as the user that installed brew
BREW_USER="$(ls -ld $BREW | awk '{print $3}')"
if [ "$BREW_USER" != "$USER" ]; then
  BREW="sudo -i -u $BREW_USER $BREW"
fi

sudo chown -R $(id -u $BREW_USER):$(id -g $BREW_USER) $BREW_PREFIX || true

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
libmaxminddb \
libtool \
libyaml \
make \
openssl \
pkgconfig \
rsync \
tmux \
vim \
wget \
xz

# clang doesn't like arguments it doesn't use
#export CFLAGS="-Qunused-arguments $CFLAGS"

export CPPFLAGS="$CPPFLAGS -I$BREW_PREFIX/include"
export LDFLAGS="$LDFLAGS -L$BREW_PREFIX/lib"

# brew keg only...
# brew info --json=v1 --installed | jq "map(select(.keg_only == true) | .name)"
#for pkg in bison bzip2 expat icu4c libffi ncurses openssl readline sqlite zlib; do
#export PATH="$BREW_PREFIX/opt/$pkg/bin:$PATH"
#export LDFLAGS="$LDFLAGS -L$BREW_PREFIX/opt/$pkg/lib"
#export CPPFLAGS="$CPPFLAGS -I$BREW_PREFIX/opt/$pkg/include"
#export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$BREW_PREFIX/opt/$pkg/lib/pkgconfig"
#done
