#! /usr/local/bin/fish
sudo cp /private/etc/apache2/httpd.conf .
sudo mv /private/etc/apache2/httpd.conf /private/etc/apache2/httpd.conf.default
patch -p0 < patchs/base/httpd.conf.patch
sudo mv httpd.conf /private/etc/apache2/

sudo cp /private/etc/php.ini .
sudo mv /private/etc/php.ini /private/etc/php.ini.default
patch -p0 < patchs/base/php.ini.patch
sudo mv php.ini /private/etc/

sudo cp /private/etc/php-fpm.conf .
sudo mv /private/etc/php-fpm.conf /private/etc/php-fpm.conf.default
patch -p0 < patchs/base/php-fpm.conf.patch
sudo mv php-fpm.conf /private/etc/

# enable autostart apache
# sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist

# disable autostart apache
# sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist

