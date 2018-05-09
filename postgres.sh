hostname
ip=`hostname -I`

ls -l /workspace
echo $ip > /workspace/ip.txt
export ip=$ip
cat /workspace/ip.txt
