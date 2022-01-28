#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

echo "-- install openjdk 8"
java_version=8
ARCHINAME=`dpkg --print-architecture`

apt-get update
apt-get install openjdk-8-jdk -y

echo "-- set java home -- "
echo "-- edit /etc/profile after install --"
echo "" >> /etc/profile
echo "JAVA_HOME='/usr/lib/jvm/java-1.${java_version}.0-openjdk-${ARCHINAME}'" >> /etc/profile
echo "export JAVA_HOME" >> /etc/profile

