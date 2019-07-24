#! /bin/bash
red='\E[31;1m'
if [ "$USER" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

if ! [ -f keypair/gitolite.pub ]; then
    echo -e $red"--- Pub key file does not exists."; tput sgr0
    exit 1
fi

apt-get update

echo "-- Install git"
apt-get install sudo git-core -y

echo "-- Add user and group 'git'"
adduser --system --shell /bin/bash --gecos 'Hosting git repositories' \
        --group --disabled-password --home /home/git git

# Prepare install
su git -c "cp keypair/gitolite.pub install_from_source.sh ~/"

# Prepare gitolitr-admin key
su git -c "mkdir ~/.ssh"
su git -c "cp keypair/gitolite ~/.ssh/id_rsa"
su git -c "chmod 400 ~/.ssh/id_rsa"
echo -e $red"-- Run install_from_source.sh"; tput sgr0
su - git

