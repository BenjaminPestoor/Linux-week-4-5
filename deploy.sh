#!/bin/bash
#==============================================
#MASTER SALT INSTALL
#==============================================
apt install salt-master -y
apt install salt-ssh -y


#==============================================
#MASTER SALT SETTINGS
#==============================================
  #Downloading salt-minion/salt-master config files
wget http://10.1.1.6/salt-master/salt-master/master.conf -O /etc/salt/master.d/master.conf
wget http://10.1.1.6/salt-master/salt-minion/minion.conf -O /etc/salt/minion.d/minion.conf

  #Creating Salt directories
  #Salt States directories
mkdir -p /srv/salt/
mkdir -p /srv/salt/states/
mkdir -p /srv/salt/states/base/

  #Salt Pillars directories
mkdir -p /srv/salt/pillars/
mkdir -p /srv/salt/pillars/base/

#==============================================
#MASTER SALT STATE FILES
#==============================================

  #Downloading Apache2 init file
mkdir -p /srv/salt/states/base/apache2/
wget http://10.1.1.6/salt-master/apache2/init.sls -O /srv/salt/states/base/apache2/init.sls

  #Downloading mysql-client init file
mkdir -p /srv/salt/states/base/mysql-client/
wget http://10.1.1.6/salt-master/mysql-client/init.sls -O /srv/salt/states/base/mysql-client/init.sls

  #Downloading php init file
mkdir -p /srv/salt/states/base/php/
wget http://10.1.1.6/salt-master/php/init.sls -O /srv/salt/states/base/php/init.sls

  #Downloading rsyslog init file and config
mkdir -p /srv/salt/states/base/rsyslog/
wget http://10.1.1.6/salt-master/rsyslog/init.sls -O /srv/salt/states/base/rsyslog/init.sls
wget http://10.1.1.6/salt-master/rsyslog/remote.conf -O /srv/salt/states/base/rsyslog/remote.conf

  #Downloading snmp init file
mkdir -p /srv/salt/states/base/snmp/
wget http://10.1.1.6/salt-master/snmp/init.sls -O /srv/salt/states/base/snmp/init.sls

  #Downloading snmpd init file and config
mkdir -p /srv/salt/states/base/snmpd/
wget http://10.1.1.6/salt-master/snmpd/init.sls -O /srv/salt/states/base/snmpd/init.sls
wget http://10.1.1.6/salt-master/snmpd/snmpd.conf -O /srv/salt/states/base/snmpd/snmpd.conf
