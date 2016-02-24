NGINX_VERSION="1.8.1"

WD="$PWD"

rm -fR nginx-${NGINX_VERSION}* ngx_* lua-* v[0-9]*

getpkg http://luajit.org/download/LuaJIT-2.0.4.tar.gz
tar zxf LuaJIT-2.0.4.tar.gz
cd  LuaJIT-2.0.4
$PMAKE PREFIX=$VENV
make PREFIX=$VENV install
cd $WD

getpkg http://www.kyne.com.au/~mark/software/download/lua-cjson-2.1.0.tar.gz
tar zxf lua-cjson-2.1.0.tar.gz
cd lua-cjson-2.1.0
make CFLAGS="$CFLAGS -I $VENV/include/luajit-2.0" LDFLAGS="$LDFLAGS -lluajit-5.1" PREFIX=$VENV install
cd $WD

getpkg https://github.com/simpl/ngx_devel_kit/archive/v0.2.19.tar.gz
tar zxf v0.2.19.tar.gz

getpkg https://github.com/openresty/lua-nginx-module/archive/v0.9.17.tar.gz
tar zxf v0.9.17.tar.gz

getpkg https://github.com/yaoweibin/nginx_upstream_check_module/archive/v0.3.0.tar.gz
tar zxf v0.3.0.tar.gz

getpkg http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar zxf nginx-${NGINX_VERSION}.tar.gz
cd nginx-${NGINX_VERSION}

patch -p1 < $WD/nginx_upstream_check_module-0.3.0/check_1.7.2+.patch

export LUAJIT_LIB="$VENV/lib"
export LUAJIT_INC="$VENV/include/luajit-2.0"

./configure --prefix=$VENV \
--with-http_ssl_module \
--with-http_stub_status_module \
--http-client-body-temp-path=$RUN_DIR/nginx/client_body_temp \
--http-proxy-temp-path=$RUN_DIR/nginx/proxy_temp \
--http-fastcgi-temp-path=$RUN_DIR/nginx/fastcgi_temp \
--http-uwsgi-temp-path=$RUN_DIR/nginx/uwsgi_temp \
--http-scgi-temp-path=$RUN_DIR/nginx/scgi_temp \
--http-log-path=$LOG_DIR/nginx/nginx-access.log \
--error-log-path=$LOG_DIR/nginx/nginx-error.log \
--pid-path=$RUN_DIR/nginx/nginx.pid \
--lock-path=$RUN_DIR/nginx/nginx.lock \
--with-cc-opt="$CFLAGS" \
--with-ld-opt="$LDFLAGS -Wl,-rpath,$VENV/lib" \
--add-module=$WD/ngx_devel_kit-0.2.19 \
--add-module=$WD/lua-nginx-module-0.9.17 \
--add-module=$WD/nginx_upstream_check_module-0.3.0

$PMAKE
make install
