#! /bin/bash
#@see https://docs.docker.com/install/linux/docker-ce/debian/

apt-get update
apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y

# Add GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo -n "Is key added (yes/no) ? "; read RESULT;
if [ $RESULT != "yes" ]; then
	echo "Add key failed, check and run this script again."
	exit 0;
fi

# Create source list --- Jessie
echo  "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

apt-get update

# Install
apt-get install docker-ce -y

# service docker start
invoke-rc.d docker start
