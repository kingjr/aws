# aws
aws setup

```
# Install apt-get dependencies
sudo apt-get update
sudo apt-get install git htop g++ --fix-missing

# Run default default install
git clone https://github.com/kingjr/aws
sh aws/setup_conda.sh
sh aws/user_setup.sh
sudo sh aws/sudo_setup.sh

# kill server
lsof nohup.out
kill -9 PID
```
