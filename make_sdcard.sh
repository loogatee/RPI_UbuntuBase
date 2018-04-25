#!/bin/sh
set -x


#RPI_KERNEL_DIR="/opt/linux-rpi"



#   See the make_raspboot.sh procedure.
#   
#   It makes an sdcard with the default raspbian-stretch-lite image
#         
#   Here's the output from qparted from this sdcard:  ****  This is a 4GB card ******

  All this with:    sudo gparted

      unallocated     unallocated                                           4.00 MiB
      /dev/sdc1       fat32          /media/johnr/boot      boot            43.10 MiB
      /dev/sdc2       ext4           /media/johnr/rootfs    rootfs          1.69 GiB
      unallocated     unallocated                                           1.95 GiB

  Do this:

       - first of all, unmount sdc2 if it was mounted
       - delete sdc2, and then apply.
       - With the 'unallocated of 3.63 GB', Create 'New':
                  - free space preceding      4
                  - New size                  3669
                  - free space following      48
                  - align to                  MiB

            'Label' to: rootfs

             <Add>

       - Right Click the ext4 partion --> Format to --> ext4;    Apply All Operations


  gparted is now this:

      unallocated     unallocated                                           4.00 MiB
      /dev/sdc1       fat32          /media/johnr/boot      boot            43.10 MiB
      unallocated     unallocated                                           4.90 MiB
      /dev/sdc2       ext4                                                  3.58 GiB
      unallocated     unallocated                                           47 MiB




  Empty out both boot and rootfs directories    Done

  Note the name of the modified rootfs  (like a big long UUID number)


       - successfully used 'gnome-disks' to create label rootfs.   you can do that

       - Unplug, replug.    Now I have a:

                      - /media/johnr/boot
                      - /media/johnr/rootfs



               ****   Both are empty  ****   


    - Execute:   make_boot.sh

    - Execute:   make_rootfs.sh


                    This will make the card ready to go, ready to boot


    - Run Card on the Pi 3.

            - Execute 1stboot_config.sh
                   * adds sshd and lua

    -




















