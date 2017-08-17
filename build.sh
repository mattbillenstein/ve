#!/bin/bash -xv

set -e

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

source $SCRIPTPATH/config.sh
source $SCRIPTPATH/deps.sh

if [ "$1" == "--clean" ]; then
shift
sudo rm -fR $VENV
elif [ "$1" == "--realclean" ]; then
shift
sudo rm -fR $VENV $PKG_CACHE /data
if [ "$MOS" == "OSX" ]; then
rm -fR ~/Library/Caches/pip
fi
else
echo 'Doing an incremental build, are you sure?  (Ctrl-C to abort)'
read foo
fi

sudo rm -fR $VENV/ve $BUILD_DIR
sudo mkdir -p $BUILD_DIR $VENV/lib $VENV/include $LOG_DIR $RUN_DIR
sudo chown -R $USER:$GROUP $VENV $BUILD_DIR $LOG_DIR $RUN_DIR

# make everything world readable
sudo chmod -R a+r $VENV

# some of the build tools point various /var stuff at /data -- make sure it
# exists
sudo mkdir -p /data
sudo chown $USER:$GROUP /data

# copy snapshot of these scripts to the venv for running deps.sh on new hosts
cp -a . $VENV/ve

# debug
if [ "$1" != "" ]; then

for f in $*; do
cd $BUILD_DIR
source $SCRIPTPATH/$f
done

else

# main install
for f in $SCRIPTPATH/pkgs/*.sh; do
cd $BUILD_DIR
source $f
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

if [ "$MOS" == "Ubuntu" ] || [ "$MOS" == "Arch" ]; then
sudo bash -c "echo $VENV/lib > /etc/ld.so.conf.d/venv.conf"
sudo ldconfig
fi

echo "System Link Report:"
if [ "$MOS" == "OSX" ]; then
/usr/bin/file $VENV/bin/* $VENV/opt/*/bin/* | grep -v 'text executable' | grep executable | awk -F : '{print $1}' | xargs \
otool -L 2>&1 | egrep -v ':$' | sort | uniq -c | sort -k1n | grep -v "$VENV"
else
ldd $VENV/bin/* $VENV/opt/*/bin/* | grep '=>' | awk '{print $1, $2, $3}' | grep -v vdso.so.1 | sort | uniq -c | sort -k1n | grep -v "$VENV"
fi
