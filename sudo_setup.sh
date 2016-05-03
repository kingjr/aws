#!/bin/bash
# Setup jupyter server at launch
# ln /home/ubuntu/aws/update.sh /etc/init.d/  # symbolic link
# chmod +x /etc/init.d/update.sh  # make it executable
# update-rc.d update.sh defaults  # enable startup
# update-rc.d update.sh start 20 2 3 4 5 . stop 20 0 1 6 .  # legacy mode
cp /home/ubuntu/aws/run_at_launch.conf /etc/init/

# Setup jupyter server ssl
mkdir certs
cd certs
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"
cd /home/ubuntu/
