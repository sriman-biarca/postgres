hostname
ip=`hostname -I`

ls -l /workspace
echo $ip > /workspace/ip.txt
cat /workspace/ip.txt

for i in {0..15}; do echo  "$i"_script1; sleep 1; done; echo
