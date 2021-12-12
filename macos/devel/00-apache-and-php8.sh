#! /bin/bash

brew install apache2

echo "###########################################################"
echo "#                                                         #"
echo "# php 8.0 make drupal happey, 8.1 will be installed later #"
echo "#                                                         #"
echo "###########################################################"
brew install php@8.0

SDIR=${PWD}

echo "###########################################################"
echo "#                                                         #"
echo "# 1. upgrade php8.x will make path changed ~              #"
echo "# 2. some manual change get some better feel              #"
echo "#    ~/Source/Markdowns/drupal/PHP8-Drupal.md             #"
echo "#                                                         #"
echo "###########################################################"
cd /opt/homebrew/Cellar/php@8.0/8.0.13/bin
./pecl install xdebug

cd $SDIR
cp ./ext-xdebug.ini /opt/homebrew/etc/php/8.0/conf.d

cd /opt/homebrew/etc/php/8.0
patch -p0 < "$SDIR/php.ini.patch"

cd /opt/homebrew/etc/httpd
patch -p0 < "$SDIR/httpd.conf.changed.patch"

