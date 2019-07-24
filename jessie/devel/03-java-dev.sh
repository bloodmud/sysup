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

echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list
apt-get update
apt-get install openjdk-8-jdk -y

update-alternatives --config java

echo "-- set java home -- "
echo "-- edit /etc/profile after install --"
echo "" >> /etc/profile
echo "JAVA_HOME='/usr/lib/jvm/java-1.${java_version}.0-openjdk-amd64'" >> /etc/profile
echo "export JAVA_HOME" >> /etc/profile

