#!/bin/bash -xv

set -e

source ./config.sh
source ./deps.sh

sudo rm -fR $VENV $BUILD_DIR
sudo mkdir -p $VENV $BUILD_DIR $VENV/ve
sudo chown -R $USER:$GROUP $VENV $BUILD_DIR

# copy snapshot of these scripts to the venv for running deps.sh on new hosts
cp -a . $VENV/ve

# main install
for f in $VENV/ve/pkgs/*.sh; do
cd $BUILD_DIR
source $f
done

# Clean things up a bit
sudo chown -R $USER:$GROUP $VENV
cd $VENV
mv sbin/* bin/
rm -fR conf doc etc html logs man sbin $BUILD_DIR
find $VENV/lib -name '*.a' -delete

if [ "$MOS" == "Ubuntu" ]; then
sudo bash -c "echo $VENV/lib > /etc/ld.so.conf.d/venv.conf"
sudo ldconfig
fi

echo "System Link Report:"
if [ "$MOS" == "OSX" ]; then
find $VENV -name '*.dylib' | xargs otool -L | egrep -v ':$' | sort | uniq -c | sort -k1n | grep -v '/opt/venv/'
else
find $VENV -name '*.so' | xargs ldd | grep '=>' | awk '{print $1, $2, $3}' | grep -v vdso.so.1 | sort | uniq -c | sort -k1n | grep -v '/opt/venv/'
fi
