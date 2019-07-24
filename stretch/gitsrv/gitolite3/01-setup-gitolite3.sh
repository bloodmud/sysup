#! /bin/bash
red='\E[31;1m'
if [ "$USER" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

apt-get update

echo "-- Install gitolite3"
echo "-- Use key: /root/.ssh/authorized_keys"
apt-get install sudo git-core gitolite3 -y

su - gitolite3

