#! /usr/local/bin/fish

# Install Nginx from Homebrew

set SCRIPTDIR $PWD

# install nginx
brew install nginx

# autostart nginx on bootup
ln -sfv /usr/local/opt/nginx/*.plist ~/Library/LaunchAgents

# setting up nginx configuration
set NGINX_PATH "/usr/local/etc/nginx"

cd $NGINX_PATH
#cp nginx.conf nginx.conf.default
#patch -p0 < $SCRIPTDIR/patchs/nginx/nginx.conf.patch

# setup nginx virtual host files -- match nginx.conf
#mkdir servers-available

# setup devbox virtual host
#cp $SCRIPTDIR/patchs/nginx/devbox servers-available/
#ln -s servers-available/devbox servers/devbox

# enable Autostart Sevice
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist

# disable autostart
# launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist

