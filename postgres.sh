#!/bin/bash
PG_VERSION=10
sudo chown -R postgres:postgres /var/lib/postgresql/10/
sudo chmod -R u=rwX,go= /var/lib/postgresql/10/


echo "host    all             all             0.0.0.0/0                    trust" |  sudo tee -a "/etc/postgresql/$PG_VERSION/main/pg_hba.conf"

# Restart so that all new config is loaded:
sudo service postgresql restart

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

ls -l /workspace
echo "IP=`hostname -I`" > /workspace/ip.txt


cat /workspace/ip.txt
source /workspace/ip.txt
echo $IP

PGPASSWORD=postgres psql -U postgres -h $IP -c "create user test with password 'test';"
