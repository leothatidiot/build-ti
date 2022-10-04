#!/bin/bash
# Desc: tested on CentOS7, CentOS8, RockyLinux8

cat >> /etc/sysctl.conf <<EOF
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF
sysctl -p

if [ $version -ne 7 ]; then
	exit 0
fi