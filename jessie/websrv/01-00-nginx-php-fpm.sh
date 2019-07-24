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

cd $SCRIPTDIR
source n-02-php-ext.sh

echo "-- install nginx source"
# back to current script path
cd ${SCRIPTDIR}
if [ ! -f /etc/apt/sources.list.d/nginx.list ]
then
	echo "-- install nginx apt source"
	wget -q -O - http://nginx.org/keys/nginx_signing.key | apt-key add -
	cp ../apt/nginx.list /etc/apt/sources.list.d/

	apt-get update
fi

echo "-- install nginx"
apt-get install nginx -y
echo "-- install nginx dynamic modules"
apt-get install nginx-module-geoip nginx-module-image-filter nginx-module-njs nginx-module-perl nginx-module-xslt -y

echo "-- install New Relic agent for NGINX"
# New Relic -- @see https://newrelic.com
# cat /usr/share/doc/nginx-nr-agent/README.txt
# apt-get install nginx-nr-agent -y

# Nginx default root is /usr/share/nginx/html
mkdir /var/www
cp -R /usr/share/nginx/html /var/www/

echo "-- update nginx default site"
cd /etc/nginx/conf.d
if [ ! -f /etc/nginx/conf.d/default.orig ]
then
	mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.orig

	mkdir /etc/nginx/conf.a
	cp ${SCRIPTDIR}/patchs/config-samples/site-base.conf /etc/nginx/conf.a/
	ln -s /etc/nginx/conf.a/site-base.conf /etc/nginx/conf.d/
fi

echo "-- update nginx.conf and fastcgi_params"
cd /etc/nginx

if [ ! -f nginx.conf.orig ]
then
	cp nginx.conf nginx.conf.orig
	patch -N -p0 -b < "${SCRIPTDIR}/patchs/nginx.conf.patch"
fi

if [ ! -f fastcgi_params.orig ]
then
	cp fastcgi_params fastcgi_params.orig
	patch -N -p0 -b < "${SCRIPTDIR}/patchs/fastcgi_params.patch"
fi

echo " NOTE: ======================================================="
echo "       Use unix socket as default after installation.         "
echo "       To use port, please edit /etc/nginx/conf.d/default.conf"
echo "         and /etc/php5/fpm/pool.d/www.conf                    "
echo " ============================================================="

echo "restart nginx and php5-fpm"
/etc/init.d/php5-fpm restart
/etc/init.d/nginx restart

