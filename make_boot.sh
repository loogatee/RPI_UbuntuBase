#!/bin/sh
set -x


RPI_KERNEL_DIR="/opt/linux-rpi"


sudo rm -rf boot
mkdir boot


cd boot; rsync -avD ../raspbian_boot/* .; cd ..

cd boot; cp $RPI_KERNEL_DIR/arch/arm/boot/kernel7.img .; cd ..

cd boot; cp $RPI_KERNEL_DIR/arch/arm/boot/dts/*.dtb .; cd ..

cd boot/overlays; cp $RPI_KERNEL_DIR/arch/arm/boot/dts/overlays/*.dtbo .; cd ../..


#
#   Overwrite cmdline.txt with this
#
echo "dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=PARTUUID=fece4c84-02 rootfstype=ext4 elevator=deadline rw fsck.repair=yes rootwait" > boot/cmdline.txt


#
#    Add 'enable_uart=1' to very end of boot/config.txt
#
sudo sed -i "\$aenable_uart=1" boot/config.txt


echo " "
echo " "
echo " "
echo            PARTUIID in boot/cmdline.txt
echo " "
echo " "
echo " "


cd boot; rsync -avD * /media/johnr/boot; cd ..




