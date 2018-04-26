#!/bin/sh
set -x

#
#   Create .img from sdcard.
#
#sudo dd bs=1M if=/dev/sdc of=Z.img count=3909091328 iflag=count_bytes status=progress


#
#   Takes .img and burns it to RPI Compute Module
#
sudo dd if=Z.img of=/dev/sdd bs=1M status=progress conv=fsync 

#
#   Persistence rule in udev:    /etc/udev/rules.d/70xxxxx
#



#
#   Change the Hostname
#

