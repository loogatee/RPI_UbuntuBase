#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime

locale-gen en_US.UTF-8
dpkg-reconfigure locales
apt-get update
apt-get -y install openssh-server

/bin/sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
/usr/bin/service ssh restart

#apt-get -y install busybox-static
#ln -s /bin/busybox /sbin/udhcpd
#
#apt-get -y install iptables
apt-get -y --force-yes install usbutils
apt-get -y --force-yes install liblua5.1-0-dev

#sed -n '
#1,/^ENDOFFILE/ {
#   /^exit 0/i modprobe g_multi file=/dev/mmcblk0p1 cdrom=0 stall=0 removable=1 nofua=1 iManufacturer=BDAT  iSerialNumber=3456 iProduct=Apex2 host_addr=00:1D:7B:11:22:35\n
#   /^exit 0/i sleep 1\n
#   /^exit 0/i ifconfig usb0 192.168.7.2 netmask 255.255.255.252 up\n
#   /^exit 0/i /sbin/udhcpd -S /etc/udhcpd.conf\n
#   /^exit 0/i #iptables -F
#   /^exit 0/i #iptables -t nat -F
#   /^exit 0/i #iptables -t mangle -F
#   /^exit 0/i #iptables -X
#   /^exit 0/i #iptables -t nat -X
#   /^exit 0/i #iptables -t mangle -X
#   /^exit 0/i #iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#   /^exit 0/i #iptables -A FORWARD -i usb0 -j ACCEPT
#   /^exit 0/i #echo 1 > /proc/sys/net/ipv4/ip_forward\n
#   /^exit 0/i #route add default gw 192.168.7.1 usb0\n
#   /^exit 0/i echo 74 > /sys/class/gpio/export
#   /^exit 0/i echo 75 > /sys/class/gpio/export
#   /^exit 0/i echo out > /sys/class/gpio/gpio74/direction
#   /^exit 0/i echo out > /sys/class/gpio/gpio75/direction\n
#   p
#}' </etc/rc.local >/tmp/t.local

#sync
#
#mv /tmp/t.local /etc/rc.local
#chmod 755 /etc/rc.local


#
#  makes 'UUID' entry in /etc/fstab
#
#ZZ=`ls -1 /dev/disk/by-uuid`
#XX=`echo "UUID="$ZZ`
#echo $XX "/     ext4    errors=remount-ro 0       1" >> /etc/fstab


# echo 'running apt-get upgrade'
# apt-get -y upgrade



#
#   install some .debs from debian jessie
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


cp /etc/apt/sources.listORG /etc/apt/sources.list
apt-get update


#

#echo 'edit /etc/network/interfaces: remove eth0 entries for Black Diamond carrier'


