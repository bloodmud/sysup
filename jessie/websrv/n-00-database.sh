#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
	echo -e $red"--- Please run this script by root."; tput sgr0
	exit 0
fi

echo -n "Which database to be installed ? (mysql/maria) "; read DBSever
if [ "$DBSever" == "mysql" ]
then
	apt-get install mysql-server mysql-client -y
fi

if [ "$DBSever" == "maria" ]; then
	if [ ! -f /etc/apt/sources.list.d/mariadb.list ]
	then
		echo "-- install MariaDB apt source"
		apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db

		cp ../apt/mariadb.list /etc/apt/sources.list.d/

		apt-get update
	fi

	echo "-- install MariaDB server"
	apt-get install mariadb-server mariadb-client -y
fi

cp patchs/multi-byte.cnf /etc/mysql/conf.d/
/etc/init.d/mysql restart

echo -e -n $red"Make the database server more security now ? (yes/no) "; read yesno
if [ "$yesno" == "yes" ]; then
	mysql_secure_installation
fi

tput sgr0
