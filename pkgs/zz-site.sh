# This is the last package built -- add your dependencies here

git clone https://github.com/metabrainz/postgresql-musicbrainz-collate.git
cd postgresql-musicbrainz-collate
make install PG_CONFIG=$VENV/bin/pg_config
cd ..

git clone https://github.com/metabrainz/postgresql-musicbrainz-unaccent.git
cd postgresql-musicbrainz-unaccent
make install PG_CONFIG=$VENV/bin/pg_config
cd ..

$VENV/bin/npm install -g webpack
$VENV/bin/npm install -g casperjs
$VENV/bin/npm install -g babel-cli
$VENV/bin/npm install -g babel-preset-es2015
