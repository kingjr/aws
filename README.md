# aws
## Launch

user-data
```
#!/bin/bash
sh /home/ubuntu/aws/update.sh | tee /home/ubuntu/output.txt
echo "Hello World.  The time is now $(date -R)!" | tee /home/ubuntu/output.txt
```

Security: open to the world
```
custom TCP 8888 0.0.0.0/0
SSH TCP 22 0.0.0.0/0
HTTPS TCP 443 0.0.0.0/0
```

SSH connect
```
local_key=~/.credentials/*.pem
IP=XXX.XXX.XXX.XXX
ssh -i $local_key ubuntu@$IP
```

kill server
```
lsof nohup.out
kill -9 PID
```


## Setup

SSH key

```
XXX
```

SSH prepare
```
local_key=~/.credentials/*.pem
IP=XXX.XXX.XXX.XXX
ssh -i $local_key ubuntu@$IP 'mkdir .credentials'
scp -i $local_key ~/.credentials/dropbox.pem ubuntu@$IP:/home/ubuntu/.credentials/
scp -i $local_key ~/.credentials/boto.cfg ubuntu@$IP:/home/ubuntu/.credentials/
```

EC2 Setup

```
# Install apt-get dependencies
sudo apt-get update
sudo apt-get install git htop g++ --fix-missing

# Run default default install
git clone https://github.com/kingjr/aws
sh aws/setup_conda.sh
sh aws/user_setup.sh
sudo sh aws/sudo_setup.sh
```

