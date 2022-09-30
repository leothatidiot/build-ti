#!/bin/bash
# setup

yum install -y nginx
yum install -y curl
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

cp -f ./config.json   /usr/local/etc/v2ray/config.json
cp -f ./default.conf  /etc/nginx/conf.d/default.conf

service nginx start
service v2ray start