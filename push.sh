#!/bin/bash

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

source $SCRIPTPATH/config.sh

# re-package the source on every push
rm -fR $VENV/ve
git gc --aggressive
cp -a $SCRIPTPATH $VENV/ve

rsync -a --delete --delete-excluded --exclude '*.swp' --rsync-path="mkdir -p $RSYNC_PATH && rsync" $* $VENV/ $RSYNC_USER@$RSYNC_HOST:$RSYNC_PATH/$OS
