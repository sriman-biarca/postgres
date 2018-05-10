source /workspace/ip.txt
echo $IP

#PGPASSWORD=postgres psql -U postgres -h $IP -c "create user test with password 'test';"
PGPASSWORD=postgres psql -U postgres -h 192.168.10.2 -c "create user test with password 'test';"
