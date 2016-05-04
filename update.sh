#!/bin/bash
# Update itself
cd /home/ubuntu/aws
git pull origin master
cd /home/ubuntu
sh /home/ubuntu/update_all.sh
