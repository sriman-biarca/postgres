ls -l /workspace
echo "IP=`hostname -I`" > /workspace/ip.txt


cat /workspace/ip.txt
source /workspace/ip.txt
echo $IP

sudo service postgresql status
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"
sudo service postgresql status
