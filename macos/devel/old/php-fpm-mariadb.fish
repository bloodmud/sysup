#! /usr/local/bin/fish

# @see http://havee.me/mac/2014-01/install-nginx-php-fpm-mysql-on-os-x.html
# Install Nginx, PHP-FPM, MariaDB from Homebrew

set SCRIPTDIR $PWD

# install nginx
brew install nginx

# autostart nginx on bootup
ln -sfv /usr/local/opt/nginx/*.plist ~/Library/LaunchAgents

# setting up nginx configuration
set NGINX_PATH "/usr/local/etc/nginx"

cd $NGINX_PATH
cp nginx.conf nginx.conf.default
patch -p0 < $SCRIPTDIR/patchs/nginx/nginx.conf.patch

# setup nginx virtual host files -- match nginx.conf
mkdir servers-available

# setup devbox virtual host
cp $SCRIPTDIR/patchs/nginx/devbox servers-available/
ln -s servers-available/devbox servers/devbox

# setup hosts
# edit /etc/hosts, add following line
# 127.0.0.1 {test-domain}

###############################
# install PHP-FPM
brew tap homebrew/php

# install curl to make curl run properly !!!
# @see brew options php56
brew install curl --with-openssl

# install php56 with fpm
brew install -v php56

# autostart php-fpm on bootup
ln -sfv /usr/local/opt/php@5.6/*.plist ~/Library/LaunchAgents

# install XDebug (php 5.6)
brew install php56-xdebug

# install Opcache (php 5.6)
brew install php56-opcache

# Check path: Change default PHP-FPM to installed here
# Change php-fpm port -- avoid conflicts with xdebug
set PHP56 "/usr/local/etc/php/5.6"
cd $PHP56

cp php-fpm.conf php-fpm.conf.default
patch -p0 < $SCRIPTDIR/patchs/php/php-fpm.conf.patch

cp php.ini php.ini.default
patch -p0 < $SCRIPTDIR/patchs/php/php.ini.patch

cd conf.d/
cp ext-opcache.ini ext-opcache.ini.default
patch -p0 < $SCRIPTDIR/patchs/php/ext-opcache.ini.patch
cp ext-xdebug.ini ext-xdebug.ini.default
patch -p0 < $SCRIPTDIR/patchs/php/ext-xdebug.ini.patch

###############################
# install MariaDB
brew install mariadb

# setup mariadb service
ln -sfv /usr/local/opt/mariadb/*.plist ~/Library/LaunchAgents


# enable Autostart Sevice
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

# disable autostart
# launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
# launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
# launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

