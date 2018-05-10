#!/bin/bash

PG_VERSION=10
PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"

# Update package list and upgrade all packages
sudo apt update
sudo apt -y upgrade

sudo apt -y install libpq-dev # For building ruby 'pg' gem
sudo apt -y install pgadmin3

wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

sudo apt-get update

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8

sudo apt-get update
sudo apt -y upgrade
sudo apt-get install -y postgresql-$PG_VERSION postgresql-contrib-$PG_VERSION postgresql-client-$PG_VERSION

# Edit postgresql.conf to change listen address to '*':
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

# Append to pg_hba.conf to add password auth:
#sudo echo "host    all             all             all                     md5" >> "$PG_HBA"
echo "host    all             all             all                     md5" |  sudo tee -a "$PG_HBA"

# Explicitly set default client_encoding
#sudo echo "client_encoding = utf8" >> "$PG_CONF"
echo "client_encoding = utf8" |  sudo tee -a "$PG_CONF"

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

# Restart so that all new config is loaded:
sudo service postgresql restart

ls -l /workspace
echo "IP=`hostname -I`" > /workspace/ip.txt


cat /workspace/ip.txt
source /workspace/ip.txt
echo $IP
