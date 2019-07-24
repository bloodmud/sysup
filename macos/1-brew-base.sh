#! /bin/bash

# install fish
brew install fish
#brew install autojump

# install shell tools
brew install tmux
# install mosh from homepage
# https://mosh.org/#getting
#brew install mosh

# install git
brew install git

echo ###############################################
echo "sudo su -"
echo "cp /etc/shells /etc/shells.orig"
echo "sudo echo "/usr/local/bin/fish" >> /etc/shells"
echo "chsh -s /usr/local/bin/fish"
echo ###############################################

# install wget & aria2
brew install wget
brew install aria2

# install unrar, p7zip
brew install unrar
brew install p7zip

# install macvim
# !!! Plase install XCode before install MacVim
brew install tre # install agrep
brew install macvim

#brew install ctags  -- old version
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
# ctags -R --fields=+aimlS --languages=php

brew install editorconfig

# install golang stable
brew install golang

cp config.fish ~/.config/fish/
