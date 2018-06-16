#!/bin/bash
apt install salt-master -y
apt install salt-ssh -y


#==============================================
#CLIENT SERVER SALT
#==============================================
mkdir /srv/salt/
mkdir /srv/salt/states/
mkdir /srv/salt/states/base/
mkdir /srv/salt/states/base/snmpd/
mkdir /srv/salt/states/base/snmp/
mkdir /srv/salt/states/base/rsyslog/
mkdir /srv/salt/states/base/php/
mkdir /srv/salt/states/base/mysql-client/
mkdir /srv/salt/states/base/apache2/
mkdir /srv/salt/pillars/
mkdir /srv/salt/pillars/base/
