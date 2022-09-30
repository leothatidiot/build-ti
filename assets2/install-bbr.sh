#!/bin/bash
# Desc: tested on CentOS7, CentOS8, RockyLinux8

version=$(cat /etc/redhat-release | tr -cd '[0-9]' | cut -c1)

if [ $version -eq 7 ]; then
	yum install -y epel-release elrepo-release
	yum --enablerepo=elrepo-kernel -y install kernel-ml
fi

cat >> /etc/sysctl.conf <<EOF
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
EOF
sysctl -p


if [ $version -ne 7 ]; then
	exit 0
fi