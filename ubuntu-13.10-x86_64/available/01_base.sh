# update system
echo "deb http://archive.ubuntu.com/ubuntu/ saucy universe" >> /etc/apt/sources.list

apt-get update
apt-get upgrade

# install additional packages
apt-get install apg curl gparted lrzsz lvm2 ssh tmux vim-gnome vim-nox

# remove "try ubuntu dialog"
apt-get purge ubiquity
