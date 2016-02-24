CONSUL_VERSION="0.6.3"

CONSUL_PLATFORM="linux"
if [ "$MOS" == "OSX" ]; then
CONSUL_PLATFORM="darwin"
fi
getpkg https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_${CONSUL_PLATFORM}_amd64.zip
unzip consul_${CONSUL_VERSION}_${CONSUL_PLATFORM}_amd64.zip
chmod 755 consul
mv consul $VENV/bin/
getpkg https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip
mkdir consul-ui
cd consul-ui
unzip ../consul_${CONSUL_VERSION}_web_ui.zip
cd ..
mkdir -p $VENV/share
mv consul-ui $VENV/share/
