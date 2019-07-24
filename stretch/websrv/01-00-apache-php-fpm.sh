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

echo "-- install Apache2"
apt-get install apache2 apache2-doc -y

echo "-- install Certbot"
apt-get install python-certbot python-certbot-apache -y

echo "-- install cronolog"
apt-get install cronolog -y

echo "-- install Apache2 Xsendfile module"
apt-get install libapache2-mod-xsendfile -y

echo "-- Enable/Disable Apache2 modules"
a2enmod actions alias
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

echo "Restart Apache2 and PHP7.0-FPM"
service php7.0-fpm restart
service apache2 restart

