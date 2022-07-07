OPENRESTY_VERSION="1.17.8.2"
OPENRESTY_SHA256SUM="2f321ab11cb228117c840168f37094ee97f8f0316eac413766305409c7e023a0"

rm -fR openresty-${OPENRESTY_VERSION}* ngx_* nginx_*

git clone https://github.com/yaoweibin/nginx_upstream_check_module.git
cd nginx_upstream_check_module
git checkout e538034b6ad79
cd $BUILD_DIR

# git clone https://github.com/zebrafishlabs/nginx-statsd.git   # dead repo
# git clone https://github.com/apcera/nginx-statsd  # also dead
git clone https://github.com/lindenlab/nginx-statsd.git
cd nginx-statsd
git checkout b970e40
cd $BUILD_DIR

getpkg https://github.com/leev/ngx_http_geoip2_module/archive/refs/tags/3.3.tar.gz 41378438c833e313a18869d0c4a72704b4835c30acaf7fd68013ab6732ff78a7
tar zxf 3.3.tar.gz

getpkg https://openresty.org/download/openresty-${OPENRESTY_VERSION}.tar.gz $OPENRESTY_SHA256SUM
tar zxf openresty-${OPENRESTY_VERSION}.tar.gz

cd openresty-${OPENRESTY_VERSION}/bundle/nginx-1.17.8
patch -p1 < $BUILD_DIR/nginx_upstream_check_module/check_1.16.1+.patch
cd $BUILD_DIR

cd openresty-${OPENRESTY_VERSION}

# hack for macos 10.15 xcode bug - 2020/03/26
CFLAGS="$CFLAGS -fno-stack-check" \
./configure --prefix=$VENV/opt/openresty \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_v2_module \
--with-http_auth_request_module \
--with-http_realip_module \
--http-client-body-temp-path=$RUN_DIR/nginx/client_body_temp \
--http-proxy-temp-path=$RUN_DIR/nginx/proxy_temp \
--http-fastcgi-temp-path=$RUN_DIR/nginx/fastcgi_temp \
--http-uwsgi-temp-path=$RUN_DIR/nginx/uwsgi_temp \
--http-scgi-temp-path=$RUN_DIR/nginx/scgi_temp \
--http-log-path=$LOG_DIR/nginx/nginx-access.log \
--error-log-path=$LOG_DIR/nginx/nginx-error.log \
--pid-path=$RUN_DIR/nginx/nginx.pid \
--lock-path=$RUN_DIR/nginx/nginx.lock \
--with-cc-opt="$CPPFLAGS" \
--with-ld-opt="$LDFLAGS -Wl,-rpath,$VENV/lib" \
--add-module=$BUILD_DIR/nginx_upstream_check_module \
--add-module=$BUILD_DIR/nginx-statsd \
--add-module=$BUILD_DIR/ngx_http_geoip2_module-3.3

$PMAKE
make install

PATH=$VENV/opt/openresty/bin:$PATH

$VENV/opt/openresty/bin/opm get pintsized/lua-resty-http
$VENV/opt/openresty/bin/opm get bungle/lua-resty-session
$VENV/opt/openresty/bin/opm get pronan/lua-resty-datetime
$VENV/opt/openresty/bin/opm get hamishforbes/lua-ffi-zlib
