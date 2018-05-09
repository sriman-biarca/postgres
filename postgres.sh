ls -l /workspace
echo "IP=`hostname -I`" > /workspace/ip.txt


cat /workspace/ip.txt
source /workspace/ip.txt
echo $IP
#service postgresql status
