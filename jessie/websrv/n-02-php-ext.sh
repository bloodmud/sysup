#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
	echo -e $red"--- Please run this script by root."; tput sgr0
	exit 0
fi

echo "-- install pecl uuid module"
apt-get install uuid-dev
pecl install uuid-1.0.3

# enable uuid module
INI_FILE="/etc/php5/mods-available/uuid.ini"
echo "; configuration for uuid module" > $INI_FILE
echo "; priority=20" >> $INI_FILE
echo -e "\n" >> $INI_FILE
echo "extension=uuid.so" >> $INI_FILE
php5enmod uuid

echo "-- install pecl uploadprogress module"
pecl install uploadprogress

INI_FILE="/etc/php5/mods-available/uploadprogress.ini"
echo "; configuration for uploadprogress module" > $INI_FILE
echo "; priority=20" >> $INI_FILE
echo -e "\n" >> $INI_FILE
echo "extension=uploadprogress.so" >> $INI_FILE
php5enmod uploadprogress

echo "-- install twig module -- improve twig performance"
apt-get install php5-twig -y

