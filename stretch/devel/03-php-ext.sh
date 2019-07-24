#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
	echo -e $red"--- Please run this script by root."; tput sgr0
	exit 0
fi

echo "-- enable php-dev php-xdebug phpunit"
apt-get install php-dev php-xdebug phpunit -y

# enable xdebug remote
echo "xdebug.remote_enable=1" >> /etc/php/7.0/mods-available/xdebug.ini
echo "xdebug.max_nesting_level=256" >> /etc/php/7.0/mods-available/xdebug.ini

service php7.0-fpm restart

