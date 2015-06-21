#!/bin/bash

sudo chown -R $(whoami) /usr/local || true

if [ "$(which brew)" == "" ]; then
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew deps - unlink/install/link in this order to make it as easy as
# possible...
#
# for cask in $(brew list); do echo "$cask -> $(brew deps $cask | xargs echo)"; done
#
# autoconf ->
# binutils ->
# file-formula ->
# findutils ->
# gdbm ->
# git ->
# gmp ->
# gnu-sed ->
# gnu-tar ->
# gnu-which ->
# gpatch ->
# gzip ->
# less ->
# libjpeg ->
# libtasn1 ->
# lzip ->
# make ->
# pcre ->
# pkg-config ->
# readline ->
# unzip ->
# watch ->
# wdiff ->
# xz ->
#
# automake -> autoconf
# coreutils -> xz
# curl -> pkg-config
# diffutils -> xz
# ed -> lzip
# gawk -> xz
# gettext -> xz
# grep -> pcre xz
# libpng -> xz
# m4 -> xz
# makedepend -> pkg-config
# nettle -> gmp
# rsync -> autoconf
# sqlite -> readline
#
# gnu-indent -> gettext xz
# gnutls -> gmp libtasn1 nettle pkg-config xz
# openssl -> makedepend pkg-config
#
# libevent -> makedepend openssl pkg-config
# openssh -> makedepend openssl pkg-config
# python -> gdbm makedepend openssl pkg-config readline sqlite
# wget -> makedepend openssl pkg-config
#
# tmux -> libevent makedepend openssl pkg-config
# vim -> python

brew tap homebrew/dupes

brew update

for keg in autoconf binutils file-formula findutils gdbm git gmp gnu-sed gnu-tar gnu-which gpatch gzip less libjpeg libtasn1 lzip ncurses make pcre pkg-config readline unzip watch wdiff xz automake coreutils curl diffutils ed gawk gettext grep libpng m4 makedepend nettle rsync sqlite gnu-indent gnutls openssl libevent openssh python wget tmux vim cairo gcc cmake; do
    brew unlink $keg || true
    if [ "$keg" == "cairo" ]; then
        brew install $keg --without-x11
    else
        brew install $keg --default-names
    fi
    if [ "$keg" == "gettext" ]; then
        brew link $keg --force
    else
        brew link $keg --force
    fi
done

# hack gnubin path - superior cmdline utilities IMO
PTH="export PATH=$(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
if ! grep -q "$PTH" ~/.bashrc; then
cat >> ~/.bashrc <<EOF
$PTH
EOF
fi

# check
brew doctor || true
