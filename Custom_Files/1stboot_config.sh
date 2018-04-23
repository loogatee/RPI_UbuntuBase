#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime

locale-gen en_US.UTF-8
dpkg-reconfigure locales

apt-get update
apt-get -y --force-yes install openssh-server

/bin/sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
/usr/bin/service ssh restart

#apt-get -y install busybox-static
#ln -s /bin/busybox /sbin/udhcpd
#
#apt-get -y install iptables
apt-get -y --force-yes install usbutils
apt-get -y --force-yes install liblua5.1-0-dev


# echo 'running apt-get upgrade'
# apt-get -y upgrade



#
#   install some packages from debian jessie
#

cp /etc/apt/sources.listJESSIE /etc/apt/sources.list
apt-get update
#
apt-get -y --force-yes install lrzsz
apt-get -y --force-yes install minicom
apt-get -y --force-yes install lua5.1
apt-get -y --force-yes install lua-socket
apt-get -y --force-yes install lua-bitop
apt-get -y --force-yes install luarocks
#
cp /etc/apt/sources.listORG /etc/apt/sources.list
apt-get update


#

#echo 'edit /etc/network/interfaces: remove eth0 entries for Black Diamond carrier'


