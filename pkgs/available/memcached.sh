MEMCACHED_VERSION="1.4.24"
getpkg http://www.memcached.org/files/memcached-${MEMCACHED_VERSION}.tar.gz
tar zxf memcached-${MEMCACHED_VERSION}.tar.gz
cd memcached-${MEMCACHED_VERSION}

# clang fix
# items.c:1141:28: error: comparison of constant 256 with expression of type 'uint8_t' (aka 'unsigned char') is always true
#       [-Werror,-Wtautological-constant-out-of-range-compare]
#     assert(it->slabs_clsid < LARGEST_ID);
#            ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
# /usr/include/assert.h:93:25: note: expanded from macro 'assert'
#     (__builtin_expect(!(e), 0) ? __assert_rtn(__func__, __FILE__, __LINE__, #e) : (void)0)
#                         ^

patch -p1 <<EOF
--- memcached-1.4.24/items.c	2015-04-25 13:47:33.000000000 -0700
+++ memcached-1.4.24-fix/items.c	2015-07-25 01:37:56.000000000 -0700
@@ -1138,7 +1138,6 @@
     item **head, **tail;
     assert(it->it_flags == 1);
     assert(it->nbytes == 0);
-    assert(it->slabs_clsid < LARGEST_ID);
     head = &heads[it->slabs_clsid];
     tail = &tails[it->slabs_clsid];
EOF

./configure --prefix=$VENV
$PMAKE
make install
