The ve toolkit

Who:

I'm Matt Billenstein -- I work mostly on backend systems supporting medium size
web applications in Python.  I love rsync.

Why:

I like OSS software, but one of the problems I've had is keeping a consistent
set of tools around for use on both my development and production systems.

The intention of this project is to stage all the common tooling into the same
build prefix -- not relying too much on the underlying system packages gives us
more control over which versions of each tool we use and when they get updated.

What:

This is a set of build scripts for compiling tools and libraries I use in
building backend systems.  It's intended as a way to keep these tools in sync
across multiple hosts using rsync as well as supporting multiple operating
systems and underlying package management systems.

Currently, it supports recent Ubuntu LTS releases (20.04 / 22.04) and recent
versions of MacOS (using homebrew), so it allows you to develop natively on
MacOS or Ubuntu and deploy to Ubuntu using the same versions of all of these
tools with a relatively small number of system shared-library dependencies.

As of July 2022 it contains:

$ grep -h _VERSION= pkgs/available/*.sh | grep -v '^#' | sed -e 's/_VERSION=/ /g' -e 's/"//g' | awk '{printf "%-10s %12s\n", $1, $2}' | sort

AIRFLOW                             2.3.2
CURL                               7.67.0
DNSMASQ                              2.85
GETTEXT                              0.21
GMP                                 6.2.1
GOLANG                             1.15.3
HAPROXY                            2.0.13
JEMALLOC                            5.2.1
LIBBOOST                           1.59.0
LIBEVENT                    2.1.11-stable
LIBGCRYPT                           1.8.5
LIBICONV                             1.16
LIBIDN2                             2.3.0
LIBUNISTRING                       0.9.10
LIBXML2                            2.9.10
LIBXSLT                            1.1.34
MARIADB                           10.4.12
MEMCACHED                           1.6.7
METABASE                           0.43.4
MONGODB                             5.0.3
MONGODB_TOOLS                     100.5.0
MYSQL                           5.7.33-36
NCURSES                               6.2
NGINX                              1.19.9
NODEJS                            16.13.0
NSQ                                 1.2.1
OPENRESTY              ${NGINX_VERSION}.1
OPENSSL                            1.1.1q
PCRE                                 8.45
PERL                               5.36.0
PGBOUNCER                          1.17.0
PHP                                7.2.34
POSTGRES                             14.4
PROXYSQL                            2.2.1
PYPY                               v7.3.2
PYTHON                             3.9.13
READLINE                            8.1.2
REDIS                               7.0.2
RUBY                                2.7.4
SQUID                                 5.6
VARNISH                             6.4.0
XZ                                  5.2.4
ZLIB                               1.2.12

Where:

If you want to use this for real in any sort of production environment, you
should fork this repo and build it yourself.  Stage your own config_local.sh
and optionally use a staging host to synchronize this between your systems via
rsync and ssh (see push/pull.sh).


Notes:

I recommend using supervisord as your init for starting servers -- I plan to
add example configs for these eventually.
