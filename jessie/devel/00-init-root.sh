#! /bin/bash
red='\E[31;1m'
user=`whoami`
if [ "$user" != "root" ]
then
    echo -e $red"--- Please run this script by root."; tput sgr0
    exit 0
fi

SCRIPDIR=${PWD}
cd ~

echo "copy vim config files"
tar xzf ${SCRIPDIR}/patchs/vim.tar.gz

echo "patch .bashrc file"
cp .bashrc orig.bashrc
patch -N -p0 < ${SCRIPDIR}/patchs/root.bashrc.patch

source .bashrc

cd ${SCRIPDIR}
