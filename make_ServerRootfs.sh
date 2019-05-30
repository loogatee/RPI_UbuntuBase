#!/bin/sh
set -x

# Additions:
#    - can remove some ttyX conf's in /etc.   Remove them all.
#

HOSTNAME="rpi3bwall"


sudo rm -rf ServerRootfs
mkdir ServerRootfs


cd ServerRootfs; sudo rsync -avD /home/ubuntu_server_18.04.1/* .; cd ..


#sudo cp Custom_Files/serial-autodetect-console.conf  ServerRootfs/etc/init
#sudo cp Custom_Files/serial-console                  ServerRootfs/bin
#sudo cp Custom_Files/1stboot_config.sh               ServerRootfs/root
#sudo cp Custom_Files/install_openssh.sh              ServerRootfs/root
#sudo cp Custom_Files/failsafe.conf                   ServerRootfs/etc/init
#sudo cp Custom_Files/markdown                        ServerRootfs/usr/bin
#sudo cp Custom_Files/sudoers                         ServerRootfs/etc

#sudo chown root:root ServerRootfs/etc/sudoers
#sudo chmod 440       ServerRootfs/etc/sudoers


#sudo mkdir                                           ServerRootfs/usr/share/lua
#sudo mkdir                                           ServerRootfs/usr/share/lua/5.1
#sudo mkdir                                           ServerRootfs/etc/luafcgid
#sudo mkdir                                           ServerRootfs/var/log/luafcgid


#sudo cp Custom_Files/LuaFCGI/luafcgidWDEBUG          ServerRootfs/usr/bin
#sudo cp Custom_Files/LuaFCGI/luafcgidNORMAL          ServerRootfs/usr/bin
#sudo cp Custom_Files/LuaFCGI/luafcgid.init           ServerRootfs/etc/init.d/luafcgid
#sudo cp Custom_Files/LuaFCGI/luafcgid.lua            ServerRootfs/usr/share/lua/5.1
#sudo cp Custom_Files/LuaFCGI/config.lua              ServerRootfs/etc/luafcgid

#sudo rm -f                                          ServerRootfs/etc/init/plymouth*
#sudo rm -f                                           ServerRootfs/etc/init/tty*
#sudo rm -f                                          ServerRootfs/etc/init/mountnfs*

#sudo rsync -avD Custom_Files/Monkey                  ServerRootfs/var/local
#sudo rsync -avD Custom_Files/lzmq/lzmq1              ServerRootfs/var/local
#sudo rsync -avD Custom_Files/lzmq/lzmq2              ServerRootfs/var/local
#sudo rsync -avD Custom_Files/cdc3                    ServerRootfs/var/local

sudo mkdir                                           ServerRootfs/lib/firmware
sudo rsync -avD Custom_Files/brcm                    ServerRootfs/lib/firmware


#
#  This creates ServerRootfs/etc/network/interfaces.d/lo:
#
#sudo /bin/bash -c "echo auto lo >       ServerRootfs/etc/network/interfaces.d/lo"
#sudo sed -i "\$aiface lo inet loopback" ServerRootfs/etc/network/interfaces.d/lo

#
#  This creates ServerRootfs/etc/network/interfaces.d/eth0:
#
#sudo /bin/bash -c "echo auto eth0 >   ServerRootfs/etc/network/interfaces.d/eth0"
#sudo sed -i "\$aiface eth0 inet dhcp" ServerRootfs/etc/network/interfaces.d/eth0

#
#  This creates ServerRootfs/etc/network/interfaces.d/wlan0
#
#sudo /bin/bash -c "echo auto wlan0 >                              ServerRootfs/etc/network/interfaces.d/wlan0"
#sudo sed -i "\$aiface wlan0 inet dhcp"                            ServerRootfs/etc/network/interfaces.d/wlan0
#sudo sed -i "\$awpa-conf /etc/wpa_supplicant/wpa_supplicant.conf" ServerRootfs/etc/network/interfaces.d/wlan0


#
#   Removes passwd from root
#
#sudo sed -i "s/root:x:0/root::0/g" ServerRootfs/etc/passwd

#
#   Creates /etc/resolv.conf
#
#sudo rm -f                                          ServerRootfs/etc/resolv.conf
#sudo /bin/bash -c "echo nameserver $NAMESERVER >   ServerRootfs/etc/resolv.conf"
#sudo ln -s /var/run/resolvconf/resolv.conf          ServerRootfs/etc/resolv.conf

#
#   Creates /etc/hostname
#
#sudo /bin/bash -c "echo $HOSTNAME >   ServerRootfs/etc/hostname"

#
#   Creates /etc/fstab
#
#sudo sed -i "\$aproc     /proc      proc      defaults     0   0" ServerRootfs/etc/fstab

#
#   Creates /var/log/luafcgid/luafcgid.lua
#
#sudo /bin/bash -c "echo '  ' >   ServerRootfs/var/log/luafcgid/luafcgid.log"



#
#    An example of a simple addition to an existing file
#    Add to the skel file also
#    
#sudo sed -i "\$aalias dir='ls -CF'" ServerRootfs/root/.bashrc
#sudo sed -i "\$aalias dir='ls -CF'" ServerRootfs/etc/skel/.bashrc



#
#  sources.list stuff
#     - copy the original
#     - Add Jessie to original, copy and save that one too
#     - use the ORIGINAL initially
#

#sudo cp ServerRootfs/etc/apt/sources.list ServerRootfs/etc/apt/sources.listORG 
#sudo sed -i "\$adeb http://ftp.us.debian.org/debian/ jessie main contrib non-free" ./ServerRootfs/etc/apt/sources.list
#sudo sed -i "\$adeb http://apt.monkey-project.com/raspbian jessie main" ./ServerRootfs/etc/apt/sources.list
#sudo cp ServerRootfs/etc/apt/sources.list    ServerRootfs/etc/apt/sources.listJESSIE
#sudo cp ServerRootfs/etc/apt/sources.listORG ServerRootfs/etc/apt/sources.list
#sudo sed -i "\$adeb http://ftp.us.debian.org/debian/ wheezy-backports main contrib non-free" ./ServerRootfs/etc/apt/sources.list
#sudo cp ServerRootfs/etc/apt/sources.list    ServerRootfs/etc/apt/sources.listWHEEZY
#sudo cp ServerRootfs/etc/apt/sources.listORG ServerRootfs/etc/apt/sources.list


#
#   Need to have the modules:  Assumes they're already built and at this location
#
#pwd
sudo rsync -avD /tmp/tmpXX/lib/modules/* ServerRootfs/lib/modules


#
#    Can remove the original tarball,
#    or copy to /tmp if it's not there yet
#
#if test $TMP1 = 1
#then
#    mv ./$UBUNTU_NAME /tmp
#else
#    rm ./$UBUNTU_NAME
#fi


#
#    Copy it to the sdcard
#
cd ServerRootfs; sudo rsync -avD * /media/johnr/ServerRootfs; cd ..
sync

