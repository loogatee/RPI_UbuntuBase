#!/bin/sh
set -x


RPI_KERNEL_DIR="/opt/linux-rpi"


#   To get the original source:
#
#   Preferrably in directory /opt, issue this command:
#
#           git clone https://github.com/raspberrypi/linux.git
#
#



export KERNEL=kernel7

cd $RPI_KERNEL_DIR; make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2709_defconfig
cd $RPI_KERNEL_DIR; make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs -j6
cd $RPI_KERNEL_DIR; scripts/mkknlimg arch/arm/boot/zImage arch/arm/boot/kernel7.img


#
#   make the modules also
#


sudo rm -rf /tmp/tmpXX 
mkdir /tmp/tmpXX

cd $RPI_KERNEL_DIR; make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=/tmp/tmpXX modules_install
find /tmp/tmpXX/lib/modules -type l -exec rm -f {} \;




