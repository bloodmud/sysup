#! /bin/bash

# install fish
brew install fish

# install shell tools
brew install tmux

# https://mosh.org/#getting
brew install mosh

# install git
brew install git
brew install git-gui

echo ###############################################
echo "change default shell to fish:"
echo "sudo su -"
echo "cp /etc/shells /etc/shells.orig"
echo "sudo echo "/usr/local/bin/fish" >> /etc/shells"
echo "chsh -s /usr/local/bin/fish"
echo ###############################################

# install wget & aria2
brew install wget
brew install aria2

# install rar, p7zip
brew install rar
brew install p7zip

# install macvim
# !!! Plase install XCode before install MacVim
brew install tre # install agrep
brew install macvim

brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags

brew install editorconfig

# install golang stable
brew install golang

mkdir -p ~/.config/fish
cp config.fish ~/.config/fish/
