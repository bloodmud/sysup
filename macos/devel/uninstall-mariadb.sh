#! /usr/local/bin/fish

# Uninstall MariaDB
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

cd /usr/local/var
rm -rf mysql

cd /usr/local/etc
rm -rf my.*

brew uninstall mariadb

