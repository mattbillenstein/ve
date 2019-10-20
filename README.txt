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

Currently, it supports recent Ubuntu LTS releases (16.04 / 18.04) and recent
versions of MacOS (using homebrew), so it allows you to develop natively on
MacOS or Ubuntu and deploy to Ubuntu using the same versions of all of these
tools with a relatively small number of system shared-library dependencies.

As of 03/16/2016 it contains:

$ grep -h _VERSION= pkgs/available/*.sh | sed -e 's/_VERSION=/ /g' -e 's/"//g' | awk '{printf "%-10s %12s\n", $1, $2}' | sort

AIRFLOW          1.10.2
BEANSTALKD         1.10
CONSUL            0.6.3
DNSMASQ            2.79
GOLANG           1.11.1
HAPROXY          1.8.13
MARIADB         10.1.13
MEMCACHED        1.5.10
METABASE         0.32.8
MONGODB           3.4.7
NODEJS          10.16.3
NSQ               1.2.0
OPENRESTY      1.13.6.2
PERL             5.26.2
PGBOUNCER         1.8.1
PHANTOMJS         2.1.1
POSTGIS           2.5.2
POSTGRES           11.5
PYPY             v6.0.0
PYTHON            3.7.5
REDIS             5.0.5
RUBY              2.4.4
SQUID               4.7
VARNISH          4.1.10
YARN             1.17.3

Where:

If you want to use this for real in any sort of production environment, you
should fork this repo and build it yourself.  Stage your own config_local.sh
and optionally use a staging host to synchronize this between your systems via
rsync and ssh (see push/pull.sh).


Notes:

I recommend using supervisord as your init for starting servers -- I plan to
add example configs for these eventually.

Many tools are built with options pointing what would typically be in /var on a
system to /data.  You'll need to create these directories manually with proper
ownership to run many of the servers at the moment.
