TERRAFORM_VERSION="0.8.7"

TERRAFORM_PLATFORM="linux_amd64"
if [ "$MOS" == "OSX" ]; then
TERRAFORM_PLATFORM="darwin_amd64"
fi

TERRAFORM_BINARY=terraform_${TERRAFORM_VERSION}_${TERRAFORM_PLATFORM}.zip

getpkg https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/${TERRAFORM_BINARY}
unzip ${TERRAFORM_BINARY}
mv terraform $VENV/bin/
