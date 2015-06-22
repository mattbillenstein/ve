#!/bin/bash

source ./config.sh

rsync -av --delete $* $SYNC_USER@$RSYNC_HOST:$RSYNC_PATH/$OS $VENV
