# aws
## Launch

user-data
```
#cloud-config
runcmd:
 - [sh, /home/ubuntu/aws/update.sh ]
 - [sh, -xc, "echo 'Hello World.  The time is now $(date -R)!' | tee /home/ubuntu/ou$
```

Security: open to the world
```
custom TCP 8888 0.0.0.0/0
SSH TCP 22 0.0.0.0/0
HTTPS TCP 443 0.0.0.0/0
```

SSH connect
```
export local_key=~/.credentials/*.pem
export IP=XXX.XXX.XXX.XXX
ssh -i $local_key ubuntu@$IP
```

kill server
```
lsof nohup.out
kill -9 PID
```

launch server without appending 'nohup.out':
```
nohup jupyter notebook > /dev/null 2>&1&
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
sudo apt-get install git htop g++ libhdf5-serial-dev bmon tig --fix-missing


# Run default default install
git clone https://github.com/kingjr/aws
sh aws/setup_conda.sh
sh aws/user_setup.sh
sudo sh aws/sudo_setup.sh
```

Mount EBS: first time: See http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

```
sudo nano /etc/hosts
# ADD "127.0.1.1 ip-10-0-0-27"
sudo file -s /dev/xvdb
sudo mkfs -t ext4 /dev/xvdb
sudo mkdir /data
sudo mount /dev/xvdb /data/
# chmod XXX to set permission
```

Change delete on termination

```aws ec2 modify-instance-attribute --instance-id i-a3XXXXX --block-device-mappings "[{\"DeviceName\": \"/dev/sda1\",\"Ebs\":{\"DeleteOnTermination\":false}}]"```
