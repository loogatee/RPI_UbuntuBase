#!/bin/bash

apt-get -y --force-yes install openssh-server
/bin/sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
/usr/bin/service ssh restart
