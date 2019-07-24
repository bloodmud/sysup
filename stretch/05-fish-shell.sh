#! /bin/bash
# 00-5-fish.sh : install fish shell

red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

if [ ! -f /etc/apt/sources.list.d/fish.list ]; then
	echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' >> /etc/apt/sources.list.d/fish.list

	wget -q -O - http://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key | apt-key add -
fi

apt-get update
apt-get install fish -y

# Set fish as default shell @see /etc/passwd
yesorno='no'
echo -e -n $red"Set fish as default shell? (yes/no) "; tput sgr0
read yesorno

if [ "$yesorno" == "yes" ]; then
	chsh -s /usr/bin/fish

	if [ ! -d ~/.config/fish ]; then
		mkdir -p ~/.config/fish
	fi
	cp config.fish ~/.config/fish/
fi

USERNAME=`su bloodmud -c "whoami"`
if [ "$USERNAME" != "bloodmud" ]; then
	adduser --home /home/bloodmud --shell /usr/bin/fish --uid 1000 bloodmud --gecos ''
else
	chsh bloodmud -s /usr/bin/fish
fi

USERCFGDIR='/home/bloodmud/.config/fish/'
if [ ! -d $USERCFGDIR ]; then
  su bloodmud -c "mkdir -p $USERCFGDIR"
fi
cp config.fish $USERCFGDIR
chown bloodmud.bloodmud $USERCFGDIR/config.fish

