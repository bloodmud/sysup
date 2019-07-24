#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

SCRIPDIR=${PWD}

echo "-- install git"
apt-get install git -y

echo "-- install to/from dos"
apt-get install tofrodos -y

echo "-- install build base requirments"
apt-get install build-essential linux-headers-amd64 -y

