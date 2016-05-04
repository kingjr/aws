#!/bin/bash
# Setup jupyter server ssl
mkdir certs
cd certs
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"
cd /home/ubuntu/

# Cloud init XXX not working?
cp /aws/user-data.txt /var/lib/cloud/data/
