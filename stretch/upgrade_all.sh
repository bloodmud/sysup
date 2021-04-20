#! /bin/fish

## Upgrade all packages, include kernel packages

apt-get update
apt-get upgrade

apt-get install linux-image-amd64
apt-get install linux-headers-amd64
