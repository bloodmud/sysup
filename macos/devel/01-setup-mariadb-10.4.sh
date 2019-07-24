#! /usr/local/bin/fish

# Install MariaDB from Homebrew

set SCRIPTDIR $PWD

###############################
# install MariaDB
brew install mariadb
cp /usr/local/etc/my.cnf /usr/local/etc/my.cnf.orig
cp my.cnf /usr/local/etc/my.cnf

# setup mariadb service
ln -sfv /usr/local/opt/mariadb/homebrew.mxcl.mariadb.plist ~/Library/LaunchAgents

# enable Autostart Sevice
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

# disable autostart
# launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

# setup - dba.master.macos
sudo mysql_secure_installation

# mysql server configuration
# 1. create mysqld run dir (pid, sock)
cd /var/run
sudo mkdir mysqld
sudo chown bloodmud:admin mysqld
cd mysqld
touch mysqld.pid

# 2. log file dir
cd /var/log
sudo mkdir mysqld
sudo chown bloodmud:admin mysqld

echo "See this :"
echo "Authentication in MariaDB 10.4 — Understanding the Changes"
# [Authentication in MariaDB 10.4] ( https://mariadb.org/authentication-in-mariadb-10-4/ )

echo "Check /var/run/mysqld, if service cannot start!"
