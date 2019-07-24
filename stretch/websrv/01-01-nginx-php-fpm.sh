#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

apt-get update

SCRIPTDIR=${PWD}
source n-01-php-fpm.sh

echo "-- install nginx"
apt-get install nginx-full -y

echo "-- install Certbot"
apt-get install python-certbot python-certbot-nginx -y

echo " NOTE: ======================================================="
echo "       Use unix socket as default after installation.         "
echo "       To use port, please edit /etc/nginx/conf.d/default.conf"
echo "         and /etc/php/7.0/fpm/pool.d/www.conf                 "
echo " ============================================================="

echo "restart nginx and php7.0-fpm"
/etc/init.d/php7.0-fpm restart
/etc/init.d/nginx restart

