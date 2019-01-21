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

apt-get -y --force-yes install ntp
apt-get -y --force-yes install git
apt-get -y --force-yes install libffi6
apt-get -y --force-yes install libffi-dev
apt-get -y --force-yes install m4
apt-get -y --force-yes install automake

apt-get -y --force-yes install iptables
apt-get -y --force-yes install wireless-tools
apt-get -y --force-yes install wpasupplicant
cp /lib/firmware/brcm/wpa_supplicant.conf /etc/wpa_supplicant


apt-get -y --force-yes install build-essential
apt-get -y --force-yes install curl
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs


#
#  static IP for Google TimeServer.  I think ubuntu's are swamped
#
sed -i "s/0.ubuntu.pool.ntp.org/216.239.35.0/" /etc/ntp.conf


# don't need this, with this version of UbuntuCore
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
#  udev rule for ttyUSB
#
/bin/bash -c 'echo SUBSYSTEM==\"tty\", ATTRS{idVendor}==\"0403\", ATTRS{idProduct}==\"6001\", MODE=\"0666\" > /etc/udev/rules.d/99-usb-serial.rules'
#
# http://vncprado.github.io/udev-rules-for-ttyusb/
#     udevadm info -a -n /dev/ttyUSB0 | grep '{serial}' | head -n1
#     SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", ATTRS{serial}=="A6008isP", SYMLINK+="ttyUSB.arduino"
#


#
#   This should be all thats needed to customize monkey
#
#mkdir /usr/share/monkey/cdcX
cp /var/local/Monkey/default         /etc/monkey/sites/default
cp /var/local/Monkey/fastcgi.conf    /etc/monkey/plugins/fastcgi/fastcgi.conf
cp /var/local/Monkey/plugins.load    /etc/monkey/plugins.load

#cp /var/local/Monkey/adget.html      /usr/share/monkey
#cp /var/local/Monkey/index.html      /usr/share/monkey
#cp /var/local/Monkey/ledsX.html      /usr/share/monkey
rsync -avD /var/local/Monkey/lua     /usr/share/monkey
rsync -avD /var/local/Monkey/imgs    /usr/share/monkey

#
#   lzmq stuff
#
mkdir                                     /usr/local/lib/lua
mkdir                                     /usr/local/lib/lua/5.1
rsync -avD /var/local/lzmq1/*             /usr/local/lib/lua/5.1
mkdir                                     /usr/share/lua/5.1/lzmq
rsync -avD /var/local/lzmq2/*             /usr/share/lua/5.1/lzmq

#
#   cdc3 hostif stuff
#
#cp /var/local/cdc3/cdc3                   /usr/local/bin
#cp /var/local/cdc3/lutils.lua             /usr/local/bin
#cp /var/local/cdc3/ConfigData.lua         /usr/share/monkey/cdcX
#cp /var/local/cdc3/cdc3_initd             /etc/init.d/cdc3
#ln -s /etc/init.d/cdc3 /etc/rc0.d/K01cdc3
#ln -s /etc/init.d/cdc3 /etc/rc1.d/K01cdc3
#ln -s /etc/init.d/cdc3 /etc/rc2.d/S01cdc3
#ln -s /etc/init.d/cdc3 /etc/rc3.d/S01cdc3
#ln -s /etc/init.d/cdc3 /etc/rc4.d/S01cdc3
#ln -s /etc/init.d/cdc3 /etc/rc5.d/S01cdc3
#ln -s /etc/init.d/cdc3 /etc/rc6.d/K01cdc3


#
#
#
chown www-data:www-data   /var/log/luafcgid
chown www-data:www-data   /var/log/luafcgid/luafcgid.log

#
#
#
chmod 777 /opt
git clone https://github.com/mascarenhas/alien.git /opt/alien
cd /opt/alien; luarocks install alien FFI_LIBDIR=/usr/lib/arm-linux-gnueabihf



#  Streamline a few things here
#
addgroup --gid 245 johnr
adduser --home /home/johnr --shell /bin/bash --uid 245 --gid 245 johnr
usermod -aG sudo johnr

#
#  Setup routing??
#
# sudo sysctl -w net.ipv4.ip_forward=1
# sudo iptables -A FORWARD -i wlan0 -j ACCEPT
# sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# echo "1" > /proc/sys/net/ipv4/ip_dynaddr
# echo "1" > /proc/sys/net/ipv4/ip_forward
# iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE


#
#   Might as well....
#
reboot



















