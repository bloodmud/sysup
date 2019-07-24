#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
	echo -e $red"--- Please run this script by root."; tput sgr0
	exit 0
fi

SCRIPTDIR=${PWD}
source n-01-php-fpm.sh
cd $SCRIPTDIR
source n-02-php-ext.sh

echo "-- install Apache2"
apt-get install apache2 apache2-doc apache2-utils apache2-mpm-worker libapache2-mod-fcgid -y

echo "-- install cronolog"
apt-get install cronolog -y

echo "-- install Apache2 Xsendfile module"
apt-get install libapache2-mod-xsendfile -y

echo "-- Enable / Disable Apache2 modules"
# Enable fastcgi and related modules
a2enmod fcgid actions alias
# Enable usefule modules
# -- rewrite need by "Clean URLs"
a2enmod expires headers status rewrite
# Disable old & out of date modules
a2dismod autoindex cgid negotiation

# Enable fastcgi proxy !!!
a2enmod proxy_fcgi

echo "-- Update Apache2 default site"
cd /etc/apache2/sites-available
if [ ! -f "000-default.conf.orig" ]
then
	cp "000-default.conf" "000-default.conf.orig"
	cp default-ssl.conf default-ssl.conf.orig
	patch -N -p0 -b < "${SCRIPTDIR}/patchs/apache.default.patch"
fi

echo "Restart Apache2 and PHP5-FPM"
service php5-fpm restart
service apache2 restart

echo -e "\n"
echo "--------------- Tip 0: Avoid ServerName Error ---------------"
echo "apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.0.1 for ServerName"
echo " 1. /etc/hosts and /etc/hostname host name are identical"
echo " 2. in /etc/hosts must like:"
echo " 127.0.0.1 localhost"
echo " 192.168.1.81 <hostname>.<domain_name> <host_name>"
echo "-------------------------------------------------------------"

echo -e "\n"
echo "--------------- Tip 1: Enable HTTPS Site ---------------"
echo "-- Enable Apache HTTPS"
echo " 1. a2enmod ssl"
echo " 2. a2ensite default-ssl"
echo "-------------------------------------------------------------"

