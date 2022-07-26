LIBXML2_VERSION="2.9.12"
LIBXML2_SHA256SUM="c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92"

rm -fR libxml2*
getpkg http://xmlsoft.org/download/libxml2-${LIBXML2_VERSION}.tar.gz $LIBXML2_SHA256SUM
tar zxf libxml2-${LIBXML2_VERSION}.tar.gz
cd libxml2-${LIBXML2_VERSION}

./configure --prefix=$VENV --without-python
$PMAKE
make install

cd $BUILD_DIR

LIBXSLT_VERSION="1.1.34"
LIBXSLT_SHA256SUM="98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f"

rm -fR libxslt*
getpkg http://xmlsoft.org/download/libxslt-${LIBXSLT_VERSION}.tar.gz $LIBXSLT_SHA256SUM
tar zxf libxslt-${LIBXSLT_VERSION}.tar.gz
cd libxslt-${LIBXSLT_VERSION}

./configure --prefix=$VENV
$PMAKE
make install
