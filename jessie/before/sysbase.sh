#! /bin/bash
# sysbase.sh

red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

SCRIPTDIR=${PWD}

yesorno='yes'
if [ -f /etc/apt/sources_updated ]; then
    echo -e -n $red"sources.list already updated, update it again? (yes/no) "; tput sgr0
    read yesorno
fi


if [ "$yesorno" == "yes" ]; then
	mv /etc/apt/sources.list /etc/apt/sources.list.orig
	cp apt/sources.list /etc/apt/sources.list
    if [ ! -f /etc/apt/sources_updated ]; then
        touch /etc/apt/sources_updated
    fi
fi

apt-get update
apt-get upgrade -y
apt-get install linux-image-amd64 aptitude -y

echo "-- install mosh & tmux"
apt-get install mosh tmux -y

echo "-- install curl"
apt-get install curl -y

echo "-- install rsync & git"
apt-get install rsync git -y

# enable time sync from internet
echo "-- install ntp"
apt-get install ntp -y

cd /etc/ssh
cp sshd_config sshd_config.orig
patch -N -p0 -b < "${SCRIPTDIR}/sshd_config.patch"

