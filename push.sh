#!/bin/bash

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

source $SCRIPTPATH/config.sh

# re-package the source on every push
rm -fR $VENV/src
cp -a $SCRIPTPATH $VENV/src

rsync -av --delete --exclude '*.swp' --bwlimit=1500 $* $VENV/ $RSYNC_USER@$RSYNC_HOST:$RSYNC_PATH/$OS
