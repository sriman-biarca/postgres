cat /workspace/ip.txt
ip=`cat /workspace/ip.txt`
echo $ip
for i in {0..15}; do echo  "$i"_script2; sleep 1; done; echo

psql -U postgres -W -h $ip -c "create user test with password 'test';"
