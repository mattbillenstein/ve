#!/bin/bash -xv

set -e

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

source $SCRIPTPATH/config.sh
source $SCRIPTPATH/deps.sh

sudo rm -fR $VENV $BUILD_DIR
sudo mkdir -p $BUILD_DIR $VENV/lib $VENV/include
sudo chown -R $USER:$GROUP $VENV $BUILD_DIR

# copy snapshot of these scripts to the venv for running deps.sh on new hosts
cp -a . $VENV/src

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
mv sbin/* bin/ || true
rm -fR conf data doc etc html logs man sbin $BUILD_DIR mysql/mysql-test mysql/sql-bench mysql/data
find $VENV/lib -name '*.a' -delete

if [ "$MOS" == "Ubuntu" ]; then
sudo bash -c "echo $VENV/lib > /etc/ld.so.conf.d/venv.conf"
sudo ldconfig
fi

echo "System Link Report:"
if [ "$MOS" == "OSX" ]; then
otool -L $VENV/bin/* 2>&1 | egrep -v ':$' | sort | uniq -c | sort -k1n | grep -v "$VENV"
else
ldd $VENV/bin/* | grep '=>' | awk '{print $1, $2, $3}' | grep -v vdso.so.1 | sort | uniq -c | sort -k1n | grep -v "$VENV"
fi
