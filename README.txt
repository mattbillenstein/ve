The ve toolkit

tldr:

$ cp config_local.sh.example config_local.sh   # edit this
$ ./build.sh

# optionally:
$ ./push.sh

# on another host:
$ ./pull.sh

# to use:
$ source /ve/bin/activate   # update $PATH, etc


Who:

I'm Matt Billenstein -- I work mostly on backend systems supporting medium size
web applications in Python.  I love rsync.


Why:

I like OSS software, but one of the problems I've had is keeping a consistent
set of tools around for use on both my development and production systems.

The intention of this project is to stage all the common tooling into the same
build prefix -- not relying too much on the underlying system packages gives us
more control over which versions of each tool we use and when they get updated.
By supporting both OSX and Ubuntu, we're able to keep production and native
development environments in parity.

Why not Vagrant/Virtualbox/VMWare?  They're all sorta hacky in their own way
with nfs mounts and whatnot -- they work, but OSX is Unix under the hood, why
not use it directly?


What:

This is a set of build scripts for compiling tools and libraries I use in
building backend systems.  It's intended as a way to keep these tools in sync
across multiple hosts using rsync as well as supporting multiple operating
systems and underlying package management systems.

Currently, it supports the Ubuntu (16.04 LTS) and recent versions of Mac OSX
(using brew), so it allows you to develop natively on OSX or Ubuntu and deploy
to Ubuntu using the same versions of all of these tools with a relatively small
number of system shared-library dependencies.

As of 10/20/2017 it contains:

r$ grep -h _VERSION= pkgs/available/*.sh | sed -e 's/_VERSION=/ /g' -e 's/"//g' -e '/^#/d' | awk '{printf "%-10s %12s\n", $1, $2}' | sort

AIRFLOW         1.7.1.3
BEANSTALKD         1.10
CONSUL            0.6.3
DNSMASQ            2.75
GOLANG            1.8.3
GRAPHITE    GITHUB_HEAD
HAPROXY          1.5.15
MARIADB         10.1.13
MEMCACHED         1.5.0
MONGODB           3.4.7
NODEJS           6.11.2
NSQ               0.3.8
OPENRESTY      1.11.2.4
PERL             5.18.2
PGBOUNCER         1.6.1
PHANTOMJS         2.1.1
POSTGRES          9.5.8
PYPY             v5.8.0
PYTHON            3.6.2
PYTHON           2.7.13
REDIS            3.2.10
RUBY              2.2.7
SQUID            3.5.26
VARNISH           4.1.8
YARN              1.0.1


Where:

You will normally build this yourself and then put it the result on a staging
host for distribution to other machines using rsync -- see the push/pull.sh
scripts.  You'll need to supply a config_local.sh to do this.


Notes:

I typically build this once and do incremental updates on top of the existing
version manually keeping the build scripts in sync as I do -- this allows
updates to roll very quickly.  Re-compiling everything makes many of the
binaries change since they have a build date in them.

I recommend using supervisord as your init for starting servers -- I plan to
add example configs for these eventually.

Many tools are built with options pointing what would typically be in /var on a
system to /data.  You'll need to create these directories manually with proper
ownership to run many of the servers at the moment.
