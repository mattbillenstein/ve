LIBXML2_VERSION="2.11.5"
LIBXML2_SHA256SUM="9d9c1026c818c1dadc81d54cc2839cd69c632590f3dcd9b2dc9ef4a136295af1"

rm -fR libxml2*
getpkg https://gitlab.gnome.org/GNOME/libxml2/-/archive/v${LIBXML2_VERSION}/libxml2-v${LIBXML2_VERSION}.tar.gz $LIBXML2_SHA256SUM
tar zxf libxml2-v${LIBXML2_VERSION}.tar.gz
cd libxml2-v${LIBXML2_VERSION}

./autogen.sh --prefix=$VENV --without-python
$PMAKE
make install

######## libxslt
cd $BUILD_DIR

LIBXSLT_VERSION="1.1.38"
LIBXSLT_SHA256SUM="639ae1e083862d97d1b9001643ed66fd43b2f59c1e3f1f92e9b6a7d53289ef77"

rm -fR libxslt*
getpkg https://gitlab.gnome.org/GNOME/libxslt/-/archive/v${LIBXSLT_VERSION}/libxslt-v${LIBXSLT_VERSION}.tar.gz $LIBXSLT_SHA256SUM
tar zxf libxslt-v${LIBXSLT_VERSION}.tar.gz
cd libxslt-v${LIBXSLT_VERSION}

./autogen.sh --prefix=$VENV
$PMAKE
make install
