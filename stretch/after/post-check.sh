#! /bin/bash
# post-check.sh

red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

apt-get update
apt-get upgrade -y

echo "-- remove all unused packageas"
apt-get autoremove --purge
echo "-- erase old downloaded archive files"
apt-get autoclean

echo "-- clear all unused configurations"
dpkg -l |grep ^rc|awk '{print $2}' | xargs dpkg -P

echo "-- erase downloaded archive files"
apt-get clean

dpkg-reconfigure locales
dpkg-reconfigure tzdata

# set default editor
select-editor
