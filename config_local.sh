# You should fork and change this...

# install prefix
VENV="/opt/ve"

# cache package downloads
PKG_CACHE="/tmp/venv-pkg"

# build directory
BUILD_DIR="$VENV/build"
DATA_DIR="/opt/data"
LOG_DIR="/opt/data/log"
RUN_DIR="/opt/data/run"

# remote rsync for push/pull
RSYNC_USER="me"
RSYNC_HOST="me.com"
RSYNC_PATH="ve"

SUBPATH="$(echo $BUILDKITE_BRANCH | tr '/' '-')"
if [ "$SUBPATH" == "" ]; then
  SUBPATH="$(git rev-parse --abbrev-ref HEAD | tr '/' '-')"
fi

RSYNC_PATH="ve/$SUBPATH"
