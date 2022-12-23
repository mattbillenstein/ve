OPENSSL_VERSION="1.1.1q"
OPENSSL_SHA256SUM="d7939ce614029cdff0b6c20f0e2e5703158a489a72b2507b8bd51bf8c8fd10ca"

rm -fR openssl*
getpkg https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz $OPENSSL_SHA256SUM
tar zxf openssl-${OPENSSL_VERSION}.tar.gz
cd openssl-${OPENSSL_VERSION}

patch -p0 <<EOF
--- test/v3ext.c.orig	2022-07-07 23:23:39.000000000 -0700
+++ test/v3ext.c	2022-07-07 23:23:40.000000000 -0700
@@ -15,6 +15,7 @@
 #include "internal/nelem.h"
 
 #include "testutil.h"
+#include <string.h>
 
 static const char *infile;
EOF
 
OPTS="--prefix=$VENV -shared"
if [ "$MOS" == "MacOS" ]; then
  OPTS="$OPTS darwin64-${MARCH}-cc"
else
  OPTS="$OPTS linux-$(uname -m)"  # x86_64 / aarch64
fi

./Configure $OPTS
$PMAKE
make install

# just put an empty file - gets replaced by cacert.sh
mkdir -p $VENV/ssl
touch $VENV/ssl/cert.pem
