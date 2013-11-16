# install latest virtualbox
echo "deb http://download.virtualbox.org/virtualbox/debian saucy contrib" >> /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
apt-get update 
apt-get install virtualbox-4.3
