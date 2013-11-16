# install teamviewer
wget http://download.teamviewer.com/download/teamviewer_linux.deb
dpkg --add-architecture i386
apt-get update
dpkg -i teamviewer_linux.deb
apt-get -f install
