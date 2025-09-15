getpkg https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${KERNEL}-${ARCH_X86_64_ARM}.tar.gz skip
tar zxf google-cloud-cli-${KERNEL}-${ARCH_X86_64_ARM}.tar.gz
mv google-cloud-sdk $VENV/opt/
