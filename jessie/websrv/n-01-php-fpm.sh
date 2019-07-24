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

# FastCGI
echo "-- install php5 fpm, pear, dev"
apt-get install php5-fpm php-pear php5-dev -y

echo "-- install php5 common extensions"
# Must install php5-fpm first !!!!!!!
apt-get install php5 php5-common php5-curl php5-gd php5-mysqlnd php5-tidy php5-xmlrpc php5-xsl php5-apcu php5-redis php5-ssh2 -y

echo "-- install phpMyadmin recommand extensions "
apt-get install mcrypt php5-mcrypt -y

# install pecl http extension
# @see http://pecl.php.net/package/pecl_http
#apt-get install php5-pecl-http -y

echo "-- setup apcu -- upload progress"
echo "apc.rfc1867=1" >> /etc/php5/mods-available/apcu.ini

echo "-- Update php.ini"
cd /etc/php5/fpm
if [ ! -f php.ini.orig ]; then
	cp php.ini php.ini.orig
	patch -N -p0 -b < "${SCRIPTDIR}/patchs/php.ini.patch"
fi

