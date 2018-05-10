source /workspace/ip.txt
echo $IP

PG_PASSWORD=postgres psql -U postgres -h $IP -c "create user test with password 'test';"
