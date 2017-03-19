#!/bin/bash -xv

set -eo pipefail

# sudo apt-get install lxc

if [ "$(id -u)" != "0" ]; then
echo "Must be root"
exit 1
fi

pushd $(dirname $0) > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

NAME="ve-build"

# uncomment this config file in /etc/default/lxc-net and 
# sudo systemctl restart lxc-net
IP=$(grep "dhcp-host=$NAME," /etc/lxc/dnsmasq.conf | awk -F , '{print $NF}')

if [ "$IP" == "" ]; then
echo "You must assign an ip for $NAME in /etc/lxc/dnsmasq.conf"
exit 1
fi

echo $NAME $IP

LXCDIR="/var/lib/lxc"
VMDIR="$LXCDIR/$NAME"
ROOTFS="$VMDIR/rootfs"

SSH_PRIVATE_KEY="/tmp/ve_id_rsa"
SSH_PUBLIC_KEY="${SSH_PRIVATE_KEY}.pub"
SSH_COMMAND="ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i $SSH_PRIVATE_KEY ubuntu@$IP"

if [ ! -f "$SSH_PRIVATE_KEY" ]; then
ssh-keygen -t rsa -N '' -f $SSH_PRIVATE_KEY
fi

if [ -e $VMDIR ]; then
lxc-stop -n $NAME || true
lxc-destroy -n $NAME || true
rm -fR $VMDIR
fi

lxc-create -n $NAME -t ubuntu

echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> $ROOTFS/etc/sudoers
mkdir -p $ROOTFS/home/ubuntu/.ssh
cp $SSH_PUBLIC_KEY $ROOTFS/home/ubuntu/.ssh/authorized_keys
chmod 600 $SSH_PUBLIC_KEY $ROOTFS/home/ubuntu/.ssh/authorized_keys

# copy the ve source
cp -a $(dirname $SCRIPTPATH) $ROOTFS/home/ubuntu/

chown -R 1000:1000 $ROOTFS/home/ubuntu

lxc-start -n $NAME --daemon --console=${VMDIR}/console --logfile=${VMDIR}/log

sleep 2

# wait for ssh to come up
while ! $SSH_COMMAND "ls /"; do
sleep 10
done

# build
$SSH_COMMAND 'cd ve && ./build.sh --realclean'
STATUS=$?

echo $STATUS

lxc-stop -n $NAME
lxc-destroy -n $NAME
rm -fR $VMDIR
