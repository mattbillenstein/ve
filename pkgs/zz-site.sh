# This is the last package built -- add your dependencies here,
# python/ruby/node pkgs, etc.

gem install sass --version "=3.2.14"
npm install -g grunt-cli

if [ "$MOS" == "Ubuntu" ]; then
sudo apt-get -y install fortune cowsay
fi

getpkg http://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/3.2.1/flyway-commandline-3.2.1.tar.gz
tar zxf flyway-commandline-3.2.1.tar.gz
mv flyway-3.2.1 $VENV/flyway
chmod 755 $VENV/flyway/flyway
