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
apt-get -y --force-yes install make
apt-get -y --force-yes install libfcgi-dev
apt-get -y --force-yes install rsync


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
apt-get -y --force-yes install libzmq1
#apt-get -y --force-yes install libzmq-dev

#
# http://monkey-project.com/documentation/1.6/embedded/raspberry.html
#
wget -qO - http://apt.monkey-project.com/monkey.key | sudo apt-key add -
apt-get -y --force-yes install monkey


#
#    GO TO:  Original + Wheezy Backports
#
cp /etc/apt/sources.listWHEEZY /etc/apt/sources.list
apt-get update

#
#    This is the payload for adding in Wheezy Backports
#          (the Jessie version didn't work due to a dependency issue)
#
apt-get -y --force-yes install libzmq3
apt-get -y --force-yes install libzmq3-dev

#
#   Takes the jessie stuff out.  Goes back to the original
#
cp /etc/apt/sources.listORG /etc/apt/sources.list
apt-get update


#
#    For getting luafcgid started up properly
#
ln -s /usr/bin/luafcgidWDEBUG /usr/bin/luafcgid
ln -s /etc/init.d/luafcgid /etc/rc0.d/K01luafcgid
ln -s /etc/init.d/luafcgid /etc/rc1.d/K01luafcgid
ln -s /etc/init.d/luafcgid /etc/rc2.d/S01luafcgid
ln -s /etc/init.d/luafcgid /etc/rc3.d/S01luafcgid
ln -s /etc/init.d/luafcgid /etc/rc4.d/S01luafcgid
ln -s /etc/init.d/luafcgid /etc/rc5.d/S01luafcgid
ln -s /etc/init.d/luafcgid /etc/rc6.d/K01luafcgid


#
#   This should be all thats needed to customize monkey
#
cp /var/local/Monkey/default         /etc/monkey/sites/default
cp /var/local/Monkey/fastcgi.conf    /etc/monkey/plugins/fastcgi/fastcgi.conf
cp /var/local/Monkey/plugins.load    /etc/monkey/plugins.load
cp /var/local/Monkey/d4.lua          /usr/share/monkey/d4.lua
cp /var/local/Monkey/dumpenv.lua     /usr/share/monkey/dumpenv.lua

#
#
#
chown www-data:www-data   /var/log/luafcgid
chown www-data:www-data   /var/log/luafcgid/luafcgid.log


#  Streamline a few things here
#
addgroup --gid 245 johnr
adduser --home /home/johnr --shell /bin/bash --uid 245 --gid 245 johnr
usermod -aG sudo johnr

#
#   Might as well....
#
reboot



















