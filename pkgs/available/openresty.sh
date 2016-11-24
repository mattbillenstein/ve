OPENRESTY_VERSION="1.11.2.2"
rm -fR openresty-${OPENRESTY_VERSION}* ngx_* nginx_*

git clone https://github.com/yaoweibin/nginx_upstream_check_module.git
cd nginx_upstream_check_module
git checkout d6341aeeb8
cd $BUILD_DIR

#git clone https://github.com/zebrafishlabs/nginx-statsd.git   # dead repo
git clone https://github.com/apcera/nginx-statsd
cd nginx-statsd
git checkout 2147d61dc3
cd $BUILD_DIR

getpkg https://openresty.org/download/openresty-${OPENRESTY_VERSION}.tar.gz
tar zxvf openresty-${OPENRESTY_VERSION}.tar.gz

cd openresty-${OPENRESTY_VERSION}/bundle/nginx-1.11.2
patch -p0 < $BUILD_DIR/nginx_upstream_check_module/check_1.11.1+.patch
cd $BUILD_DIR
cd openresty-${OPENRESTY_VERSION}

./configure --prefix=$VENV/openresty \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_v2_module \
--with-http_auth_request_module \
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
--add-module=$BUILD_DIR/nginx_upstream_check_module \
--add-module=$BUILD_DIR/nginx-statsd

$PMAKE
make install

PATH=$VENV/openresty/bin:$PATH

$VENV/openresty/bin/opm get pintsized/lua-resty-http
$VENV/openresty/bin/opm get bungle/lua-resty-session
$VENV/openresty/bin/opm get pronan/lua-resty-datetime
