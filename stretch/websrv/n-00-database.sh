#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
	echo -e $red"--- Please run this script by root."; tput sgr0
	exit 0
fi

#echo "-- install MariaDB 10.2 source"
#apt-get install software-properties-common dirmngr
#apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8

#cp ../apt/mariadb.list /etc/apt/sources.list.d/

apt-get update
apt-get install mysql-server mysql-client -y

cp patchs/multi-byte.cnf /etc/mysql/conf.d/
/etc/init.d/mysql restart

echo -e -n $red"Make the database server more security now ? (yes/no) "; read yesno
if [ "$yesno" == "yes" ]; then
	mysql_secure_installation
fi

tput sgr0
