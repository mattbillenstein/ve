# This is the last package built -- add your dependencies here,
# python/ruby/node pkgs, etc.

gem install sass --version "=3.2.14"
npm install -g grunt-cli

if [ "$MOS" == "Ubuntu" ]; then
sudo apt-get -y install fortune cowsay
fi
