#!/bin/bash
#==============================================
#MASTER SERVER SALT
#==============================================
apt install salt-master -y
apt install salt-ssh -y


#==============================================
#CLIENT SERVER SALT
#==============================================
#Creating Salt directories
#Salt States directories
mkdir /srv/salt/
mkdir /srv/salt/states/
mkdir /srv/salt/states/base/
mkdir /srv/salt/states/base/apache2/
wget http://10.1.1.6/salt-master/apache2/init.sls -O /srv/salt/states/base/apache2/init.sls
mkdir /srv/salt/states/base/mysql-client/
wget http://10.1.1.6/salt-master/mysql-client/init.sls -O /srv/salt/states/base/mysql-client/init.sls
mkdir /srv/salt/states/base/php/
wget http://10.1.1.6/salt-master/php/init.sls -O /srv/salt/states/base/php/init.sls
mkdir /srv/salt/states/base/rsyslog/
wget http://10.1.1.6/salt-master/rsyslog/init.sls -O /srv/salt/states/base/rsyslog/init.sls
wget http://10.1.1.6/salt-master/rsyslog/remote.conf -O /srv/salt/states/base/rsyslog/remote.conf
mkdir /srv/salt/states/base/snmp/
wget http://10.1.1.6/salt-master/snmp/init.sls -O /srv/salt/states/base/snmp/init.sls
mkdir /srv/salt/states/base/snmpd/
wget http://10.1.1.6/salt-master/snmpd/init.sls -O /srv/salt/states/base/snmpd/init.sls
wget http://10.1.1.6/salt-master/snmpd/snmpd.conf -O /srv/salt/states/base/snmpd/snmpd.conf

#Salt settings
wget http://10.1.1.6/salt-master/salt-master/master.conf -O /etc/salt/master.d/master.conf
wget http://10.1.1.6/salt-master/salt-minion/minion.conf -O /etc/salt/minion.d/minion.conf


#Salt Pillars directories
mkdir /srv/salt/pillars/
mkdir /srv/salt/pillars/base/
