NGINX_VERSION="1.8.1"

rm -fR nginx-${NGINX_VERSION}* ngx_*

getpkg https://github.com/simpl/ngx_devel_kit/archive/v0.2.19.tar.gz
tar zxf v0.2.19.tar.gz

getpkg https://github.com/openresty/lua-nginx-module/archive/v0.9.17.tar.gz
tar zxf v0.9.17.tar.gz

# Need a newer release for https://github.com/yaoweibin/nginx_upstream_check_module/pull/48
#getpkg https://github.com/yaoweibin/nginx_upstream_check_module/archive/v0.3.0.tar.gz
#tar zxf v0.3.0.tar.gz
git clone https://github.com/yaoweibin/nginx_upstream_check_module.git
cd nginx_upstream_check_module
git checkout 10782eaff5
cd $BUILD_DIR

git clone https://github.com/zebrafishlabs/nginx-statsd.git
cd nginx-statsd
git checkout b756a12abf  # fixes for 1.9.11+ after this break 1.8.1
cd $BUILD_DIR

getpkg http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar zxf nginx-${NGINX_VERSION}.tar.gz
cd nginx-${NGINX_VERSION}

patch -p1 < $BUILD_DIR/nginx_upstream_check_module/check_1.7.5+.patch

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
--add-module=$BUILD_DIR/ngx_devel_kit-0.2.19 \
--add-module=$BUILD_DIR/lua-nginx-module-0.9.17 \
--add-module=$BUILD_DIR/nginx_upstream_check_module \
--add-module=$BUILD_DIR/nginx-statsd

$PMAKE
make install
