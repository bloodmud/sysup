# SQL Server on Debian
# https://docs.microsoft.com/en-us/windows-server/administration/linux-package-repository-for-microsoft-software

#
apt-get install curl -y

# add dependencies of sql server
apt-get install apt-transport-https

# add sql server repository
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

echo "https://packages.microsoft.com/debian/stretch/prod/dists/
curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | sudo tee /etc/apt/sources.list.d/mssql-server.list
