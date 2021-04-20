#! /usr/local/bin/fish

# Install MariaDB from Homebrew

set SCRIPTDIR $PWD

###############################
# install MariaDB
brew install mariadb@10.3
cp patchs/mysql/multi-byte.cnf /usr/local/etc/my.cnf.d/

# setup mariadb service
#ln -sfv /usr/local/opt/mariadb/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mariadb@10.3/homebrew.mxcl.mariadb@10.3.plist ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

# enable Autostart Sevice
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

# disable autostart
# launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

# setup - dba.master.macos
mysql_secure_installation
