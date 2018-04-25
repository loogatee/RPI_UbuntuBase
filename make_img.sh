#!/bin/sh
set -x

#
#   Create .img from sdcard.
#
sudo dd bs=1M if=/dev/sdc of=X.img count=3909091328 iflag=count_bytes status=progress


#
#   Takes .img and burns it to RPI Compute Module
#
sudo dd if=X.img of=/dev/sdc bs=1M status=progress conv=fsync 



