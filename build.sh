#!/usr/bin/env bash

set -e

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

source $SCRIPTPATH/config.sh

if [ "$1" == "--clean" ]; then
  shift
  sudo rm -fR $VENV
elif [ "$1" == "--realclean" ]; then
  shift
  sudo rm -fR $VENV $PKG_CACHE $DATA_DIR
  if [ "$MOS" == "MacOS" ]; then
    rm -fR ~/Library/Caches/pip
  fi
fi

sudo rm -fR $VENV/ve $BUILD_DIR $VENV/build.log
sudo mkdir -p $BUILD_DIR $VENV/lib $VENV/include $VENV/opt $LOG_DIR $RUN_DIR
sudo chown -R $USER:$GROUP $VENV $BUILD_DIR $LOG_DIR $RUN_DIR

# make everything world readable
sudo chmod -R a+r $VENV

if [ "$1" == "--nodeps" ]; then
  shift
else
  echo "$(date) Installing dependencies..." | tee -a $VENV/build.log
  source $SCRIPTPATH/deps.sh >> $VENV/build.log 2>&1
  echo "$(date) Finished dependencies." | tee -a $VENV/build.log
fi

# some of the build tools point various /var stuff at $DATA_DIR -- make sure it
# exists
sudo mkdir -p $DATA_DIR
sudo chown $USER:$GROUP $DATA_DIR

# copy snapshot of these scripts to the venv for running deps.sh on new hosts
cp -a . $VENV/ve

# debug
if [ "$1" != "" ]; then

  set -xv
  for f in $*; do
    cd $BUILD_DIR
    rm -fR *
    source $SCRIPTPATH/$f
  done

else

  # main install
  for f in $SCRIPTPATH/pkgs/*.sh; do
    cd $BUILD_DIR
    rm -fR *
    pkg="$(basename $f)"
    pkg="${pkg%*.sh}"
    echo "$(date) Building $pkg ..." | tee -a $VENV/build.log
    source $f >> $VENV/build.log 2>&1
    echo "$(date) Finished $pkg" | tee -a $VENV/build.log
  done

fi

# Clean things up a bit
cd $VENV
mkdir -p bin
mv sbin/* bin/ || true
rm -fR conf data doc etc html logs man sbin var $BUILD_DIR mysql/mysql-test mysql/sql-bench mysql/data bin/*.pyc bin/*.bat
find $VENV/lib -name '*.a' -delete

# make all dirs 755
find $VENV -type d -print0 | xargs -0 -n 100 chmod 755 || true
# make all files ag+r
find $VENV -type f -print0 | xargs -0 -n 100 chmod ag+r || true
# make any files that are user execute group and all execute
find $VENV -type f -perm -100 ! -perm -001 -print0 | xargs -0 -n 100 chmod ag+x || true

echo "System Link Report:" >> $VENV/build.log
if [ "$MOS" == "MacOS" ]; then
  otool -L $(/usr/bin/file $(find $VENV -type f | egrep '/s*bin/') | grep "executable ${MARCH}" | awk -F : '{print $1}' | awk '{print $1}') | egrep -v ':$' | awk '{print $1}' | sort | uniq -c | sort -k1n >> $VENV/build.log 2>&1
else
  /usr/bin/file $(find $VENV -type f | egrep '/s*bin/') | grep 'dynamically linked' | awk -F : '{print $1}' | xargs -n 1 ldd | grep '=>' | awk '{print $1, $2, $3}' | sort | uniq -c | sort -k1n >> $VENV/build.log 2>&1
fi

du -h -s $VENV >> $VENV/build.log 2>&1

grep -A 1000 "System Link Report:" $VENV/build.log
