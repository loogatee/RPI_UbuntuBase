#!/bin/sh
set -x




sudo rm -rf rootfs
mkdir rootfs

cp /tmp/ubuntu-base-14.04.1-core-armhf.tar.gz .
#wget http://cdimage.ubuntu.com/ubuntu-base/releases/14.04.1/release/ubuntu-base-14.04.1-core-armhf.tar.gz


cd rootfs; sudo tar --numeric-owner -xzvf ../ubuntu-base-14.04.1-core-armhf.tar.gz; cd ..


sudo cp Custom_Files/interfaces                      rootfs/etc/network
sudo cp Custom_Files/resolv.conf                     rootfs/etc
sudo cp Custom_Files/serial-autodetect-console.conf  rootfs/etc/init
sudo cp Custom_Files/fstab                           rootfs/etc
sudo cp Custom_Files/serial-console                  rootfs/bin
sudo cp Custom_Files/hostname                        rootfs/etc
sudo cp Custom_Files/1stboot_config.sh               rootfs/root
sudo cp Custom_Files/passwd                          rootfs/etc

#
#    An example of a simple addition to an existing file
#    
sudo sed -i "\$aalias dir='ls -CF'" rootfs/root/.bashrc



#
#  sources.list stuff
#     - copy the original
#     - Add Jessie to original, copy and save that one too
#     - use the ORIGINAL initially
#

sudo cp rootfs/etc/apt/sources.list rootfs/etc/apt/sources.listORG 
sudo sed -i "\$adeb http://ftp.us.debian.org/debian/ jessie main contrib non-free" ./rootfs/etc/apt/sources.list
sudo cp rootfs/etc/apt/sources.list    rootfs/etc/apt/sources.listJESSIE
sudo cp rootfs/etc/apt/sources.listORG rootfs/etc/apt/sources.list


#
#   Need to have the modules:  Assumes they're already built and at this location
#
sudo rsync -avD /tmp/tmpXX/lib/modules/* rootfs/lib/modules/


#
#    Can remove the original tarball
#
rm ./ubuntu-base-14.04.1-core-armhf.tar.gz


#
#    Copy it to the sdcard
#
cd rootfs; sudo rsync -avD * /media/johnr/rootfs; cd ..



