#!/bin/bash

source /workspace/ip.txt
echo $IP

sudo chown -R postgres:postgres /var/lib/postgresql/10/
sudo chmod -R u=rwX,go= /var/lib/postgresql/10/

# Restart so that all new config is loaded:
sudo service postgresql restart

#PGPASSWORD=postgres psql -U postgres -h $IP -c "create user test with password 'test';"
PGPASSWORD=postgres psql -U postgres -h 192.168.10.2 -c "create user test with password 'test';"
