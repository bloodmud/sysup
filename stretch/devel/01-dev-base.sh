#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

SCRIPDIR=${PWD}
ARCHINAME=`dpkg --print-architecture`

echo "-- install poedit"
apt-get install poedit -y

echo "-- install to/from dos"
apt-get install tofrodos -y

echo "-- install meld"
apt-get install meld -y

echo "-- install golang"
apt-get install golang -y

echo "-- install c++ development tools"
apt-get install build-essential gdb -y
apt-get install ddd ddd-doc glibc-doc -y
apt-get install linux-headers-${ARCHINAME} -y

echo "-- install boost"
apt-get install libboost-dev -y

echo "-- initialize source directory"
mkdir /home/Source
chown bloodmud.bloodmud /home/Source

