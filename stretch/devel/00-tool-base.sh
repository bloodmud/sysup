#! /bin/bash
# tool-base.sh

red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

echo "-- install essential gui enviroment"
apt-get update
apt-get upgrade
apt-get install gnome-session gnome-terminal gnome-tweak-tool -y
apt-get install gnome-menus gnome-shell-extensions -y
apt-get install firefox-esr -y

echo "-- install gvim"
apt-get install vim-gtk3 vim-doc cscope exuberant-ctags -y

echo "-- install fonts"
apt-get install gnome-font-viewer xfonts-wqy fonts-freefont-ttf fonts-arphic-uming -y

echo -e $red"-- install more fonts ..."; tput sgr0
if [ ! -d /home/bloodmud/.vim ]; then
	su bloodmud -c "tar xzpf vim.tar.gz -C ~"
fi

echo "-- install git, rsync, unra"
apt-get install git gitk git-gui rsync p7zip -y

reboot
