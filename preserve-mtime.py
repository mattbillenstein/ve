#!/usr/bin/env python3

import hashlib
import json
import os
import os.path
import sys
import shutil

def hash_file(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        while 1:
            data = f.read(10_000_000)
            if not data:
                break
            h.update(data)
    return h.hexdigest()


def dump(src):
    # dump mtimes / hash to stdout as json
    d = {}
    for dname, dirs, files in os.walk(src):
        for fname in files:
            path = os.path.join(dname, fname)
            st = os.stat(path)

            d[path] = {
                'mtime': st.st_mtime_ns,
                'size': st.st_size,
                'sha256': hash_file(path),
            }

    print(json.dumps(d, indent=2))


def fix(src, fname):
    # fix mtimes in src dir using json from fname
    with open(fname) as f:
        d = json.loads(f.read())

    for dname, dirs, files in os.walk(src):
        for fname in files:
            path = os.path.join(dname, fname)
            if x := d.get(path):
                st = os.stat(path)

                times_different = st.st_mtime_ns != x['mtime']
                files_same = st.st_size == x['size'] and hash_file(path) == x['sha256']
                if times_different and files_same:
                    #print(f'Fixing mtime of {path}')
                    os.utime(path, ns=(st.st_atime_ns, x['mtime']))


def main(args):
    if len(args) == 1:
        return dump(args[0])
    elif len(args) == 2:
        return fix(*args)
    else:
        assert 0, 'Invalid args'


if __name__ == '__main__':
    main(sys.argv[1:])
