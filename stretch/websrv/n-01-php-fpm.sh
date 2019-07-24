#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
	echo -e $red"--- Please run this script by root."; tput sgr0
	exit 0
fi

SCRIPTDIR=${PWD}
source n-00-database.sh

echo "-- install php php-fpm, pear, dev"
apt-get install php php-fpm php-pear php-dev php-mbstring -y

echo "-- install php modules"
apt-get install php-curl php-gd php-imagick php-mysql php-tidy php-xmlrpc php-xsl -y
apt-get install php-apcu php-redis php-ssh2 php-uuid php-uploadprogress -y

echo "-- install phpMyadmin recommand extensions "
apt-get install mcrypt php-mcrypt -y

echo "-- setup apcu -- upload progress"
echo "apc.rfc1867=1" >> /etc/php/7.0/mods-available/apcu.ini

echo "-- Update php.ini"
cd /etc/php/7.0/fpm
if [ ! -f php.ini.orig ]; then
	cp php.ini php.ini.orig
	patch -N -p0 -b < "${SCRIPTDIR}/patchs/php.ini.patch"
fi

echo "-- swicth to php-fpm"
apt-get install libapache2-mod-fcgid -y

a2dismod php7.0
a2enmod proxy_fcgi setenvif
a2enconf php7.0-fpm

echo "-- switch to mod-php:"
echo "a2enmod php7.0"
