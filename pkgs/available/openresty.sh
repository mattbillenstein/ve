OPENRESTY_VERSION="1.15.8.3"
OPENRESTY_SHA256SUM="b68cf3aa7878db16771c96d9af9887ce11f3e96a1e5e68755637ecaff75134a8"

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

getpkg https://openresty.org/download/openresty-${OPENRESTY_VERSION}.tar.gz $OPENRESTY_SHA256SUM
tar zxf openresty-${OPENRESTY_VERSION}.tar.gz

cd openresty-${OPENRESTY_VERSION}/bundle/nginx-1.15.8
patch -p1 < $BUILD_DIR/nginx_upstream_check_module/check_1.14.0+.patch
cd $BUILD_DIR

cd openresty-${OPENRESTY_VERSION}

# hack for macos 10.15 xcode bug - 2020/03/26
CFLAGS="$CFLAGS -fno-stack-check" \
./configure --prefix=$VENV/opt/openresty \
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
--with-cc-opt="$CPPFLAGS" \
--with-ld-opt="$LDFLAGS -Wl,-rpath,$VENV/lib" \
--add-module=$BUILD_DIR/nginx_upstream_check_module \
--add-module=$BUILD_DIR/nginx-statsd

$PMAKE
make install

PATH=$VENV/opt/openresty/bin:$PATH

$VENV/opt/openresty/bin/opm get pintsized/lua-resty-http
$VENV/opt/openresty/bin/opm get bungle/lua-resty-session
$VENV/opt/openresty/bin/opm get pronan/lua-resty-datetime
$VENV/opt/openresty/bin/opm get hamishforbes/lua-ffi-zlib
