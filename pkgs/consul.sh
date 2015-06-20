if [ "$OS" == "OSX_10.9" ]; then
CONSUL_PLATFORM="darwin"
elif [ "$OS" == "Ubuntu_14.04" ]; then
CONSUL_PLATFORM="linux"
fi
getpkg https://dl.bintray.com/mitchellh/consul/0.3.1_${CONSUL_PLATFORM}_amd64.zip
unzip 0.3.1_${CONSUL_PLATFORM}_amd64.zip
chmod 755 consul
mv consul $VENV/bin/
getpkg https://dl.bintray.com/mitchellh/consul/0.3.1_web_ui.zip
unzip 0.3.1_web_ui.zip
mkdir -p $VENV/share
mv dist $VENV/share/consul-ui

