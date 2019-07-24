#! /bin/bash

red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
	echo -e $red"--- Please run this script by root."; tput sgr0
	exit 0
fi

apt-get install python-certbot-apache -t jessie-backports -y

echo -e $red"Apache: certbot --apache @see https://certbot.eff.org/#debianjessie-apache\n"; tput sgr0
echo -e $red"Enable http conf, redirect to https" # There are two redirect method
echo -e $red"certbot --authenticator webroot --installer apache --webroot-path /var/www/html/11way -d 11way.xyz -d www.11way.xyz"

echo -e $red"Nginx: certbot certonly @see https://certbot.eff.org/#debianjessie-nginx\n"; tput sgr0

echo -e $red"CRON: 5 2 1 * * /usr/bin/certbot renew\n"; tput sgr0

