LIBXML2_VERSION="2.9.10"
LIBXML2_SHA256SUM="aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f"

rm -fR libxml2*
getpkg ftp://xmlsoft.org/libxml2/libxml2-${LIBXML2_VERSION}.tar.gz $LIBXML2_SHA256SUM
tar zxvf libxml2-${LIBXML2_VERSION}.tar.gz 
cd libxml2-${LIBXML2_VERSION}

./configure --prefix=$VENV --without-python
$PMAKE
make install

cd $BUILD_DIR

LIBXSLT_VERSION="1.1.34"
LIBXSLT_SHA256SUM="98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f"

rm -fR libxslt*
getpkg ftp://xmlsoft.org/libxml2/libxslt-${LIBXSLT_VERSION}.tar.gz $LIBXSLT_SHA256SUM
tar zxvf libxslt-${LIBXSLT_VERSION}.tar.gz 
cd libxslt-${LIBXSLT_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
