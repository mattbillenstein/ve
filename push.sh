#!/bin/bash

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

source $SCRIPTPATH/config.sh

if [[ $1 == "-n" ]]; then
  echo "Dry Run"
  rsync --dry-run -av --delete --bwlimit=1500 $* $VENV/ $RSYNC_USER@$RSYNC_HOST:$RSYNC_PATH/$OS
else
  echo "Real Thing"
  rsync -av --delete --bwlimit=1500 $* $VENV/ $RSYNC_USER@$RSYNC_HOST:$RSYNC_PATH/$OS
fi