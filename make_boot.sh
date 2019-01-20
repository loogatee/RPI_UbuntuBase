#!/bin/sh
set -x


RPI_KERNEL_DIR="/opt/linux-rpi"


sudo rm -rf boot
mkdir boot


cd boot; rsync -avD ../raspbian_boot/* .; cd ..

cd boot; cp $RPI_KERNEL_DIR/arch/arm/boot/kernel7.img .; cd ..

cd boot; cp $RPI_KERNEL_DIR/arch/arm/boot/dts/*.dtb .; cd ..

if test -d boot/overlays
then
    rmdir --ignore-fail-on-non-empty boot/overlays
fi

mkdir boot/overlays

cd boot/overlays; cp $RPI_KERNEL_DIR/arch/arm/boot/dts/overlays/*.dtbo .; cd ../..


#
#   S=' /dev/sdc2: LABEL="rootfs" UUID="079af89b-9e8d-4e2d-9460-8c74aebd193a" TYPE="ext4" PARTUUID="c5474294-02" '
#
#   matches:
#       effectively matches the last 13 chars in the above string
#       And then does a capture on just the hexdigits of the PARTUUID
#

Y=`sudo blkid /dev/sdc2`
Z=`echo "S='" $Y "'; print(string.match(S,'(...........). $'))" | /usr/bin/lua`


#
#   Overwrite cmdline.txt with this
#
echo "dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=PARTUUID=$Z rootfstype=ext4 elevator=deadline rw fsck.repair=yes rootwait" > boot/cmdline.txt



#
#    Add 'enable_uart=1' to very end of boot/config.txt
#
sudo sed -i "\$aenable_uart=1" boot/config.txt


echo " "
echo " "
echo " "
echo            Verify:   PARTUIID in boot/cmdline.txt
echo " "
echo " "
echo " "


cd boot; rsync -avD * /media/johnr/boot; cd ..




