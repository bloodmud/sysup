#! /bin/bash
red='\E[31;1m'
if [ "$USER" != "git" ]
then
    echo -e $red"--- Please run this script by git."; tput sgr0
    exit 0
fi

echo "--- Get git source"
git clone git://github.com/sitaramc/gitolite

echo "--- Install gitolite"
mkdir -p $HOME/bin
gitolite/install -to $HOME/bin

$HOME/bin/gitolite setup -pk $HOME/gitolite.pub

rm $HOME/gitolite.pub
rm $HOME/install_from_source.sh -f

cd
git clone git@${HOSTNAME}:gitolite-admin

echo "--- perform any admin task ....  ---"
echo "--- exit from this user manually ---"

