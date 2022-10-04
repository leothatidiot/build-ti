
yum makecache
yum install curl

curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
bash install-release.sh

v2ray_config_path = /usr/local/etc/v2ray/config.json
cp -f ./assets/config.json $v2ray_config_path

systemctl start v2ray