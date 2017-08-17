# This is the last package built -- add your dependencies here

# need 00-perl.sh for this stuff to work I believe...
#git clone https://github.com/metabrainz/postgresql-musicbrainz-collate.git
#cd postgresql-musicbrainz-collate
#make install PG_CONFIG=$VENV/bin/pg_config
#cd ..
#
#git clone https://github.com/metabrainz/postgresql-musicbrainz-unaccent.git
#cd postgresql-musicbrainz-unaccent
#make install PG_CONFIG=$VENV/bin/pg_config
#cd ..

$VENV/bin/npm install -g webpack
$VENV/bin/npm install -g casperjs
$VENV/bin/npm install -g babel-cli
$VENV/bin/npm install -g babel-preset-es2015

# patch airflow to inject our rollbar logger -- logs deadlocked dags
$VENV/opt/airflow/bin/pip install 'rollbar==0.13.12'
cd $VENV/opt/airflow/bin
patch <<EOF
--- /tve/opt/airflow/bin/airflow    2017-03-17 23:18:38.476788031 -0700
+++ /tve-old/opt/airflow/bin/airflow        2017-01-05 17:06:49.307527575 -0800
@@ -10,6 +10,9 @@
         os.environ['KRB5CCNAME'] = configuration.get('kerberos', 'ccache')
         os.environ['KRB5_KTNAME'] = configuration.get('kerberos', 'keytab')

+    import util.rb
+    util.rb.init_rollbar()
+
     parser = CLIFactory.get_parser()
     args = parser.parse_args()
     args.func(args)
EOF
