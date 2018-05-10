#!/bin/bash

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

# Restart so that all new config is loaded:
sudo service postgresql restart

ls -l /workspace
echo "IP=`hostname -I`" > /workspace/ip.txt


cat /workspace/ip.txt
source /workspace/ip.txt
echo $IP
