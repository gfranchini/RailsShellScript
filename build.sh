#This script is intended for installing Rails on TrustyTahr
echo "Updating System..."
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
echo "Installing Ruby..."
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
cd
wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
tar -xzvf ruby-2.2.3.tar.gz (this contains verbose mode)
cd ruby-2.2.3/
./configure
make
sudo make install
echo "Installing Bundler..."
sudo gem install bundler
echo "Installing Git..."
sudo apt-get -y install git
git config --global color.ui true
git config --global user.name "Giancarlo Franchini"
git config --global user.email "gfranchini88@gmail.com"
echo "Installing NodeJS..."
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "Installing Rails..."
sudo  gem install rails -v 4.2.4
echo "Installing MySQL..."
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev
# echo "Installing PostgreSQL..."
# wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
# sudo apt-get update
# sudo apt-get install postgresql-common
# sudo apt-get install postgresql-9.3 libpq-dev
echo "Removing old packages..."
sudo apt-get -y autoremove
echo "Installation Complete!!!"
