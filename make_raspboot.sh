#!/bin/sh
set -x


#   Once it's made, you don't really need to make it anymore



#
#   Get:     xxxx-xx-xx-raspbian-stretch-lite.img
#
#   I got this one:  2018-04-18-raspbian-stretch-lite.img
#
#wget https://downloads.raspberrypi.org/raspbian_lite_latest
#unzip raspbian_lite_latest
#rm raspbian_lite_latest

#
#   Writes the .img to an sdcard
#
#        if /dev/sdc1 is mounted, unmount it    (manually, before running this)
#        if /dev/sdc2 is mounted, unmount it    (manually, before running this)
#
#  (***** TAKES  LONG TIME TO RUN ******)
#
#sudo dd bs=1M if=2018-04-18-raspbian-stretch-lite.img  of=/dev/sdc status=progress conv=fsync
#sudo dd bs=2M if=2018-04-18-raspbian-stretch-lite.img  of=/dev/sdc status=progress conv=fsync


#
#   When it's done, it should remount automatically.
#   If you're paranoid like me.   Do it manually
#


#
#     Under /media/johnr are 2 directories:
#            - boot
#            - rootfs
#
#rm -rf raspbian_boot
#mkdir raspbian_boot
#
#cd raspbian_boot; rsync -avD /media/johnr/boot/* .; rm *.dtb kernel*.img overlays/*; cd ..


















