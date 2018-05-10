#!/bin/bash
PG_VERSION=10
sudo chown -R postgres:postgres /var/lib/postgresql/10/
sudo chmod -R u=rwX,go= /var/lib/postgresql/10/

ls -la /var/lib/postgresql/10/main/

sudo cat /var/lib/postgresql/10/main/pg_hba.conf

echo "host    all             all             0.0.0.0/0                    md5" |  sudo tee -a "/etc/postgresql/$PG_VERSION/main/pg_hba.conf"

sudo service postgresql restart

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

# Restart so that all new config is loaded:
#sudo service postgresql restart

ls -l /workspace
echo "IP=`hostname -I`" > /workspace/ip.txt


cat /workspace/ip.txt
source /workspace/ip.txt
echo $IP
