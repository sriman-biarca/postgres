hostname
hostname -I

ls -l /workspace
echo "from_step1.txt" > /workspace/from_step1.txt
ls -l /workspace

for i in {0..15}; do echo  "$i"_script1; sleep 1; done; echo
