CONSUL_VERSION="0.5.2"

CONSUL_PLATFORM="linux"
if [ "$MOS" == "OSX" ]; then
CONSUL_PLATFORM="darwin"
fi
getpkg https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_${CONSUL_PLATFORM}_amd64.zip
unzip ${CONSUL_VERSION}_${CONSUL_PLATFORM}_amd64.zip
chmod 755 consul
mv consul $VENV/bin/
getpkg https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_web_ui.zip
unzip ${CONSUL_VERSION}_web_ui.zip
mkdir -p $VENV/share
mv dist $VENV/share/consul-ui
