#! /bin/bash
# sysbase.sh

red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

echo "-- install essential gui enviroment"
apt-get update
apt-get install gnome-session iceweasel gnome-terminal gnome-tweak-tool -y
apt-get install gnome-menus gnome-shell-extensions -y

if [ ! -f /etc/network/interfaces.unmanaged ]; then
	cp /etc/network/interfaces /etc/network/interfaces.unmanaged
	cp patchs/interfaces.managed /etc/network/interfaces
fi

echo "-- install gvim"
apt-get install vim-gnome vim-doc cscope ctags -y
apt-get install elinks libcanberra-gtk-module -y

echo "-- install fonts"
apt-get remove fonts-droid --purge -y
apt-get install gnome-font-viewer -y
apt-get install fonts-freefont-ttf fonts-arphic-uming -y

if [ ! -d /home/bloodmud/.vim ]; then
	su bloodmud -c "tar xzpf gvim/vim.tar.gz -C ~"
fi

FONTDIR="/home/bloodmud/.local/share/fonts"
if [ ! -f $FONTDIR/MONACO.TTF ]; then
	if [ ! -d $FONTDIR ]; then
		su bloodmud -c "mkdir $FONTDIR"
	fi
	su bloodmud -c "cp gvim/MONACO.TTF $FONTDIR/"
fi

echo -e $red"-- use ':PluginUpdate' fetch vim plugins"

echo -e $red"-- setup 'Window Titles' and 'Interface' fonts to 'Serif Regular'"
echo -e $red"-- setup 'Documents' fonts to 'AR PL UMing CN Light'"

echo "-- Install fcitx 4"
apt-get install fcitx fcitx-sunpinyin -y
echo -e $red"!!! MUST run fcitx-configtool select(add) input method !!!"; tput sgr0

echo "-- install git, rsync, unra"
apt-get install git rsync unar -y

# enable time sync from internet
echo "-- install ntp"
apt-get install ntp -y

reboot
