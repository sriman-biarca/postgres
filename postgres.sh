ls -l /workspace
echo "IP=`hostname -I`" > /workspace/ip.txt


cat /workspace/ip.txt
source /workspace/ip.txt
echo $IP

echo "service test"
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"
sudo service postgresql status
