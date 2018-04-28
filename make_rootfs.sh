#!/bin/sh
set -x

# Additions:
#    - can remove some ttyX conf's in /etc.   Remove them all.
#


HOSTNAME="bladerunner"
NAMESERVER="192.168.11.1"


UBUNTU_NAME="ubuntu-base-14.04.5-base-armhf.tar.gz"


sudo rm -rf rootfs
mkdir rootfs

#
#  one of these 2 to get the raw .gz.
#
cp /tmp/$UBUNTU_NAME .
#wget http://cdimage.ubuntu.com/ubuntu-base/releases/14.04.5/release/$UBUNTU_NAME


cd rootfs; sudo tar --numeric-owner -xzvf ../$UBUNTU_NAME; cd ..


sudo cp Custom_Files/serial-autodetect-console.conf  rootfs/etc/init
sudo cp Custom_Files/serial-console                  rootfs/bin
sudo cp Custom_Files/1stboot_config.sh               rootfs/root



sudo mkdir                                           rootfs/usr/share/lua
sudo mkdir                                           rootfs/usr/share/lua/5.1
sudo mkdir                                           rootfs/etc/luafcgid
sudo mkdir                                           rootfs/var/log/luafcgid


sudo cp Custom_Files/LuaFCGI/luafcgidWDEBUG          rootfs/usr/bin
sudo cp Custom_Files/LuaFCGI/luafcgidNORMAL          rootfs/usr/bin
sudo cp Custom_Files/LuaFCGI/luafcgid.init           rootfs/etc/init.d/luafcgid
sudo cp Custom_Files/LuaFCGI/luafcgid.lua            rootfs/usr/share/lua/5.1
sudo cp Custom_Files/LuaFCGI/config.lua              rootfs/etc/luafcgid

sudo rm -f                                           rootfs/etc/init/plymouth*
sudo rm -f                                           rootfs/etc/init/tty*
sudo rm -f                                           rootfs/etc/init/mountnfs*

sudo rsync -avD Custom_Files/Monkey                  rootfs/var/local


#
#  This creates rootfs/etc/network/interfaces.d/lo:
#
sudo /bin/bash -c "echo auto lo >       rootfs/etc/network/interfaces.d/lo"
sudo sed -i "\$aiface lo inet loopback" rootfs/etc/network/interfaces.d/lo

#
#  This creates rootfs/etc/network/interfaces.d/eth0:
#
sudo /bin/bash -c "echo auto eth0 >   rootfs/etc/network/interfaces.d/eth0"
sudo sed -i "\$aiface eth0 inet dhcp" rootfs/etc/network/interfaces.d/eth0

#
#   Removes passwd from root
#
sudo sed -i "s/root:x:0/root::0/g" rootfs/etc/passwd

#
#   Creates /etc/resolv.conf.   2nd one is preferable
#
rm -f                                               rootfs/etc/resolv.conf
#sudo /bin/bash -c "echo nameserver $NAMESERVER >   rootfs/etc/resolv.conf"
sudo ln -s /var/run/resolvconf/resolv.conf          rootfs/etc/resolv.conf

#
#   Creates /etc/hostname
#
sudo /bin/bash -c "echo $HOSTNAME >   rootfs/etc/hostname"

#
#   Creates /etc/fstab
#
sudo sed -i "\$aproc     /proc      proc      defaults     0   0" rootfs/etc/fstab

#
#   Creates /var/log/luafcgid/luafcgid.lua
#
sudo /bin/bash -c "echo '  ' >   rootfs/var/log/luafcgid/luafcgid.log"



#
#    An example of a simple addition to an existing file
#    Add to the skel file also
#    
sudo sed -i "\$aalias dir='ls -CF'" rootfs/root/.bashrc
sudo sed -i "\$aalias dir='ls -CF'" rootfs/etc/skel/.bashrc



#
#  sources.list stuff
#     - copy the original
#     - Add Jessie to original, copy and save that one too
#     - use the ORIGINAL initially
#

sudo cp rootfs/etc/apt/sources.list rootfs/etc/apt/sources.listORG 
sudo sed -i "\$adeb http://ftp.us.debian.org/debian/ jessie main contrib non-free" ./rootfs/etc/apt/sources.list
sudo sed -i "\$adeb http://apt.monkey-project.com/raspbian jessie main" ./rootfs/etc/apt/sources.list
sudo cp rootfs/etc/apt/sources.list    rootfs/etc/apt/sources.listJESSIE
sudo cp rootfs/etc/apt/sources.listORG rootfs/etc/apt/sources.list
sudo sed -i "\$adeb http://ftp.us.debian.org/debian/ wheezy-backports main contrib non-free" ./rootfs/etc/apt/sources.list
sudo cp rootfs/etc/apt/sources.list    rootfs/etc/apt/sources.listWHEEZY
sudo cp rootfs/etc/apt/sources.listORG rootfs/etc/apt/sources.list


#
#   Need to have the modules:  Assumes they're already built and at this location
#
sudo rsync -avD /tmp/tmpXX/lib/modules/* rootfs/lib/modules/


#
#    Can remove the original tarball
#
rm ./$UBUNTU_NAME


#
#    Copy it to the sdcard
#
cd rootfs; sudo rsync -avD * /media/johnr/rootfs; cd ..



