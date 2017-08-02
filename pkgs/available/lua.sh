WD="$PWD"

rm -fR LuaJIT*
getpkg http://luajit.org/download/LuaJIT-2.0.4.tar.gz
tar zxf LuaJIT-2.0.4.tar.gz
cd  LuaJIT-2.0.4
$PMAKE PREFIX=$VENV
make PREFIX=$VENV install
cd $WD

rm -fR lua-cjson-*
getpkg http://www.kyne.com.au/~mark/software/download/lua-cjson-2.1.0.tar.gz
tar zxf lua-cjson-2.1.0.tar.gz
cd lua-cjson-2.1.0
make CFLAGS="$CFLAGS -I $VENV/include/luajit-2.0" LDFLAGS="$LDFLAGS -lluajit-5.1" PREFIX=$VENV install
cd $WD

rm -fR zlib-*
getpkg http://zlib.net/zlib-1.2.11.tar.gz
tar zxf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=$VENV
make install
cd $WD

rm -fR lzlib
git clone https://github.com/LuaDist/lzlib.git
cd lzlib
make ZLIB=$VENV LUA=$VENV CFLAGS="$CFLAGS -fPIC -I $VENV/include/luajit-2.0" LDFLAGS="$LDFLAGS -lluajit-5.1" LIBS="-lz -lluajit-5.1 -L$VENV/lib" PREFIX=$VENV DISTDIR=. zlib.so
# Gah, no install target?
cp zlib.so $VENV/lib/lua/5.1/
cp gzip.lua $VENV/share/lua/5.1/
cd $WD

rm -fR v0.07* lua-resty-*
getpkg https://github.com/pintsized/lua-resty-http/archive/v0.07.tar.gz
tar zxf v0.07.tar.gz
mkdir -p $VENV/share/lua/5.1/resty
cp lua-resty-http-0.07/lib/resty/*.lua $VENV/share/lua/5.1/resty/

rm -fR 0.2.0* lua-uuid-*
getpkg https://github.com/Mashape/lua-uuid/archive/0.2.0.tar.gz
tar zxf 0.2.0.tar.gz
cd lua-uuid-0.2.0
make LUA="luajit" all
cp lua*.so $VENV/lib/lua/5.1/
cd $WD
