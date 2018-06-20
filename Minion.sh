#!/bin/bash

#==============================================
#MINION SALT INSTALL
#==============================================

apt install salt-minion -y

#==============================================
#MINION SALT SETTINGS
#==============================================
  #Downloading salt-minion config file
wget http://10.1.1.6/salt-master/salt-minion/minion.conf -O /etc/salt/minion.d/minion.conf

  #restarting salt-services
service salt-minion restart
