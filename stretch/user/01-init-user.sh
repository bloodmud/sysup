#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

SCRIPDIR=${PWD}

USERNAME=`su bloodmud -c "whoami"`
if [ "$USERNAME" != "bloodmud" ]; then
	adduser --home /home/bloodmud --shell /bin/bash --uid 1000 bloodmud --gecos ''
fi

cd ${SCRIPDIR}
su bloodmud -c "tar xzpf vim.tar.gz -C ~"

