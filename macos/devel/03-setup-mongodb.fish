#! /usr/local/bin/fish

# Install MongoDB from Homebrew

set SCRIPTDIR $PWD

###############################
# install MongoDB 
brew install mongodb

echo "## brew info mongodb ##"
brew info mongodb
