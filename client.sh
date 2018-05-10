#!/bin/bash

source /workspace/ip.txt
echo $IP

hostname -I

ping $IP -c 4 

sudo chown -R postgres:postgres /var/lib/postgresql/10/
sudo chmod -R u=rwX,go= /var/lib/postgresql/10/

# Restart so that all new config is loaded:
sudo service postgresql restart

#echo "postgres" | psql -U postgres -W -h 192.168.10.2 -c "create user test with password 'test';"

echo "test1"
#psql -U postgres -w -h 192.168.10.2 -c "create user test with password 'test';"
echo "test2"

sleep(120)
#PGPASSWORD=postgres psql -U postgres -h $IP -c "create user test with password 'test';"
PGPASSWORD=postgres psql -U postgres -h 192.168.10.2 -c "create user test with password 'test';"
