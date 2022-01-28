#! /bin/bash
# tool-base.sh

red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

apt-get update
apt-get upgrade

echo "-- install gvim"
apt-get install vim-gtk3 vim-doc cscope exuberant-ctags -y

echo "-- install fonts"
apt-get install gnome-font-viewer xfonts-wqy fonts-freefont-ttf fonts-arphic-uming -y

echo -e $red"-- install more fonts ..."; tput sgr0
if [ ! -d /home/bloodmud/.vim ]; then
	su bloodmud -c "tar xzpf vim.tar.gz -C ~"
fi

echo "-- install gitk, git-gui, unar "
apt-get install gitk git-gui unar -y

reboot
