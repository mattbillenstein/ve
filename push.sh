#!/bin/bash

source ./config.sh

rsync -av --delete $* $VENV $RSYNC_USER@$RSYNC_HOST:$RSYNC_PATH/$OS/ve
