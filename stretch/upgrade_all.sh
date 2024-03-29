#! /bin/fish

## Upgrade all packages, include kernel packages

ARCHINAME=`dpkg --print-architecture`

apt-get update
apt-get upgrade

apt-get install linux-image-${ARCHINAME}
apt-get install linux-headers-${ARCHINAME}

echo "#############################################"
echo "#                                           #"
echo "#   After restart, run:                     #"
echo "#   apt-get autoremove                      #"
echo "#   apt-get autoclean                       #"
echo "#                                           #"
echo "#############################################"

