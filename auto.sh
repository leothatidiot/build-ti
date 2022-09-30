#!/bin/bash
# author: gfw-breaker

# detect CentOS 7
if [ $version -eq 7 ]; then
	yum install -y epel-release elrepo-release
	yum --enablerepo=elrepo-kernel -y install kernel-ml
fi

if [ $version -ne 7 ]; then
  echo 'not CentOS 7'
  exit 0
fi

# disable SELinux
setenforce 0
sed -i  "s/enforcing/disabled/g" /etc/selinux/config

# disable firewalld
systemctl stop firewalld && systemctl disable firewalld

### 
# path=/grtdnlPa
# uuid=c3590324-c5be-11ea-87d0-0242ac130003
# cat > params.txt <<EOF
# path=$path
# uuid=$uuid
# EOF

# deploy
bash assets2/setup.sh
bash assets2/install-bbr.sh
