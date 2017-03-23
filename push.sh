#!/bin/bash

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

source $SCRIPTPATH/config.sh

# re-package the source on every push
rm -fR $VENV/src
git gc --aggressive
cp -a $SCRIPTPATH $VENV/src

rsync -a --delete --delete-excluded --exclude '*.swp' --bwlimit=1500 $* $VENV/ $RSYNC_USER@$RSYNC_HOST:$RSYNC_PATH/$OS
