#!/bin/sh
set -x

#
#   Create .img from sdcard.
#
sudo dd bs=1M if=/dev/sdc of=A.img count=3909091328 iflag=count_bytes status=progress


#
#   Takes .img and burns it to RPI Compute Module
#
#umount /dev/sdd2
#umount /dev/sdd1
#sleep 2
#sudo dd if=A.img of=/dev/sdd bs=1M status=progress conv=fsync 

#
#   Persistence rule in udev:    /etc/udev/rules.d/70xxxxx
#



#
#   Change the Hostname
#

