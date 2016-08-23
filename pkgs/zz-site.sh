# This is the last package built -- add your dependencies here,
# python/ruby/node pkgs, etc.

# hack to remove annoying warning in distutils
sed -i -e 's/warnings.warn(/tuple(/g' $VENV/lib/python2.7/distutils/__init__.py

$VENV/pypy/bin/pip install \
boto \
boto3 \
google-api-python-client \
psycopg2cffi \
pymongo \
requests \
rollbar

git clone https://github.com/metabrainz/postgresql-musicbrainz-collate.git
cd postgresql-musicbrainz-collate
make install PG_CONFIG=$VENV/bin/pg_config
cd ..

git clone https://github.com/metabrainz/postgresql-musicbrainz-unaccent.git
cd postgresql-musicbrainz-unaccent
make install PG_CONFIG=$VENV/bin/pg_config
cd ..

$VENV/bin/npm install -g webpack
