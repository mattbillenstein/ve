# nginx
NGINX=1.6.0
rm -fR nginx-${NGINX}* ngx_*
getpkg http://nginx.org/download/nginx-${NGINX}.tar.gz
tar zxf nginx-${NGINX}.tar.gz
cd nginx-${NGINX}
./configure --prefix=$VENV --with-http_ssl_module \
--http-client-body-temp-path=/data/run/nginx/client_body_temp \
--http-proxy-temp-path=/data/run/nginx/proxy_temp \
--http-fastcgi-temp-path=/data/run/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/data/run/nginx/uwsgi_temp \
--http-scgi-temp-path=/data/run/nginx/scgi_temp \
--http-log-path=/data/log/nginx/nginx-access.log \
--error-log-path=/data/log/nginx/nginx-error.log \
--pid-path=/data/run/nginx/nginx.pid \
--lock-path=/data/run/nginx/nginx.lock
$PMAKE
make install
