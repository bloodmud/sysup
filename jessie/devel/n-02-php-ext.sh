#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
	echo -e $red"--- Please run this script by root."; tput sgr0
	exit 0
fi

echo "-- enable php5-dbg php5-xdebug phpunit"
apt-get install php5-dbg php5-xdebug phpunit -y

# enable xdebug remote
echo "xdebug.remote_enable=1" >> /etc/php5/mods-available/xdebug.ini
echo "xdebug.max_nesting_level=256" >> /etc/php5/mods-available/xdebug.ini

echo "-- install pecl uuid package"
apt-get install uuid-dev
pecl install uuid-1.0.3

# enable uuid module
echo "extension=uuid.so" > /etc/php5/mods-available/uuid.ini
php5enmod uuid
