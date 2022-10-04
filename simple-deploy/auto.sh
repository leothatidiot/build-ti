#!/bin/bash

# detect CentOS 7
if [ $version -ne 7 ]; then
  echo 'not CentOS 7'
  exit 0
fi

# disable SELinux
setenforce 0
sed -i  "s/enforcing/disabled/g" /etc/selinux/config

# disable firewalld
systemctl stop firewalld && systemctl disable firewalld

# deploy
bash ./instsall-v2ray.sh
bash ./install-bbr.sh