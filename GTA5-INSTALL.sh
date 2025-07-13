clear
date
clear
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y ssh


wget http://temp.nuntec.com.br/gta-gestor/ldc-key.tar.gz
tar -xvzf ldc-key.tar.gz
rm ldc-key.tar.gz

sudo apt-get install -y git-core
curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

nano ~/.bashrc
#if [[ -d $HOME/.rbenv ]]; then
#  export PATH="$HOME/.rbenv/bin:$PATH"
#  eval "$(rbenv init -)"
#fi

rbenv bootstrap-ubuntu-12-04
CONFIGURE_OPTS="--no-tcmalloc" rbenv install ree-1.8.7-2012.02
rbenv global ree-1.8.7-2012.02
gem update --system
ln -sf ~/.rbenv/versions/ree-1.8.7-2012.02 ~/.rbenv/versions/1.8.7

sudo apt-get install -y imagemagick libmagickcore-dev libmagickwand-dev
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y postgresql libpq-dev
sudo su postgres -c "psql -c \"ALTER USER postgres WITH PASSWORD 'CUvSOuewRc';\""

gem install passenger -v 3.0.17
sudo /home/deploy/.rbenv/versions/ree-1.8.7-2012.02/bin/passenger-install-nginx-module
wget -O init-deb.sh http://library.linode.com/assets/660-init-deb.sh
sudo mv init-deb.sh /etc/init.d/nginx
sudo chmod +x /etc/init.d/nginx
sudo /usr/sbin/update-rc.d -f nginx defaults

gem install bundler -v 1.2.1

git clone git@git.nuntec.com.br:gta-gestor.git
cd gta-gestor
git checkout 1.3
bundle install
bundle exec rake db:create RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production
bundle exec rake db:seed RAILS_ENV=production
