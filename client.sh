#!/bin/bash

source /workspace/ip.txt
echo $IP

PG_VERSION=10

# Update package list and upgrade all packages
sudo apt update
sudo apt -y upgrade


wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

sudo apt-get update
sudo apt-get install -y postgresql-client-$PG_VERSION

#PGPASSWORD=postgres psql -U postgres -h $IP -c "create user test with password 'test';"
PGPASSWORD=postgres psql -U postgres -h 192.168.10.2 -c "create user test with password 'test';"
