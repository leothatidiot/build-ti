#!/bin/bash
# setup

yum install -y nginx
nic=$(/sbin/ifconfig | grep flags | head -n 1 | cut -d':' -f1)
domain=$(/sbin/ifconfig $nic | grep 'inet ' | awk '{print $2}')
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout  /etc/nginx/server.key -out  /etc/nginx/server.crt -subj "/C=CN/ST=$domain/L=$domain/O=$domain/OU=$domain/CN=$domain"

yum install -y curl
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

cp -f ./assets2/config.json   /usr/local/etc/v2ray/config.json
cp -f ./assets2/default.conf  /etc/nginx/conf.d/default.conf

service nginx start
service v2ray start