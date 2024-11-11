ARCH="linux-x86_64"
if [ "$MOS" == "MacOS" ]; then
  ARCH="darwin-arm"
fi
getpkg https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${ARCH}.tar.gz skip
tar zxf google-cloud-cli-$ARCH.tar.gz
mv google-cloud-sdk $VENV/opt/
