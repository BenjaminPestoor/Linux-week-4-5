#!/bin/bash

#==============================================
#MASTER UPDATE / UPGRADE
#==============================================
  #Update
apt update
  #Upgrade
apt upgrade

#==============================================
#MASTER SALT DIRECTORIES
#==============================================
  #Creating Salt directories
  #Salt States directories
mkdir -p /srv/salt/
mkdir -p /srv/salt/states/
mkdir -p /srv/salt/states/base/
mkdir -p /srv/salt/states/base/apache2
mkdir -p /srv/salt/states/base/mysql-client
mkdir -p /srv/salt/states/base/php
mkdir -p /srv/salt/states/base/rsyslog.master
mkdir -p /srv/salt/states/base/rsyslog.minion
mkdir -p /srv/salt/states/base/snmp
mkdir -p /srv/salt/states/base/snmpd

  #Salt Pillars directories
mkdir -p /srv/salt/pillars/
mkdir -p /srv/salt/pillars/base/

  #making salt directory
mkdir -p /var/www/html/cacti/

#==============================================
#MASTER SALT INSTALL CACTI / MYSQL / SALT MASTER
#==============================================
  #setting password mysql install / rsyslog mysql
debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin'
debconf-set-selections <<< 'rsyslog-mysql rsyslog-mysql/app-password-confirm password admin'
debconf-set-selections <<< 'rsyslog-mysql rsyslog-mysql/mysql/app-pass password amdin'
debconf-set-selections <<< 'rsyslog-mysql rsyslog-mysql/mysql/admin-pass  password admin'
debconf-set-selections <<< 'rsyslog-mysql rsyslog-mysql/password-confirm  password admin'
debconf-set-selections <<< 'rsyslog-mysql rsyslog-mysql/dbconfig-install  select true'

  #installing mysql
apt-get -y install mysql-server
apt-get -y install rsyslog-mysql

  #installing salt-master / salt-minion with config
apt-get -y install salt-master
wget http://10.1.1.6/salt-master/salt-master/master.conf -O /etc/salt/master.d/master.conf
apt-get -y install salt-minion
wget http://10.1.1.6/salt-master/salt-minion/minion.conf -O /etc/salt/minion.d/minion.conf
  #restarting salt-master / salt-minion
service salt-master restart
service salt-minion restart

  #waiting for salt
echo "waiting for salt 20 seconds"
sleep 10
echo "waiting for salt 10 seconds"
sleep 10
echo "accepting salt keys"

  #accepting key salt-minion
salt-key -A -y

  #install rest of needed programs
apt-get -y install php
apt-get -y install apache2
apt-get -y install php-mysql
apt-get -y install php-snmp
apt-get -y install php-xml
apt-get -y install snmp
apt-get -y install snmpd
apt-get -y install snmp-mibs-downloader
apt-get -y install rrdtool

#  #creating database cacti
#mysql --user="root" --password="admin" -e "CREATE DATABASE cacti"
#wget http://10.1.1.6/salt-master/cacti/cacti.sql -O /var/www/html/cacti/cacti.sql
#  #importing sql databse
#mysql --user="root" --password="admin" --database="cacti" -e "source /var/www/html/cacti/cacti.sql"

#==============================================
#DOWNLOAD CACTI
#==============================================

service snmpd restart
service apache2 restart

#==============================================
#MASTER SALT STATE FILES FOR MINION
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
wget http://10.1.1.6/salt-master/rsyslog.master/init.sls -O /srv/salt/states/base/rsyslog.master/init.sls
wget http://10.1.1.6/salt-master/rsyslog.minion/init.sls -O /srv/salt/states/base/rsyslog.minion/init.sls
wget http://10.1.1.6/salt-master/rsyslog.minion/remote.conf -O /srv/salt/states/base/rsyslog.minion/remote.conf
wget http://10.1.1.6/salt-master/rsyslog.master/master.conf -O /srv/salt/states/base/rsyslog.master/master.conf

  #Downloading snmp init file
mkdir -p /srv/salt/states/base/snmp/
wget http://10.1.1.6/salt-master/snmp/init.sls -O /srv/salt/states/base/snmp/init.sls

  #Downloading snmpd init file and config
mkdir -p /srv/salt/states/base/snmpd/
wget http://10.1.1.6/salt-master/snmpd/init.sls -O /srv/salt/states/base/snmpd/init.sls
wget http://10.1.1.6/salt-master/snmpd/snmpd.conf -O /srv/salt/states/base/snmpd/snmpd.conf

  #Downloading top.sls config
wget http://10.1.1.6/salt-master/salt-master/top.sls -O /srv/salt/states/base/top.sls

#==============================================
#MINION SALT INSTALL SNMP, SNMPD, RSYSLOG, MYSQL-CLIENT, PHP & APACHE2 + ALL SETTINGS FOR LOGGING AND MONITORING
#==============================================
  #restarting salt-services
service salt-master restart
service salt-minion restart

echo "salt has to load for a while"
echo "sleeping for 20 seconds"
sleep 10
echo "sleeping for 10 more seconds"
sleep 10
echo "sleeping done"

  #read top.sls and start salt
salt '*' state.apply snmp
salt '*' state.apply snmpd
salt 'Ubuntu-1710-Master-Salt-final' state.apply rsyslog.master
salt 'Ubuntu-1710-Salty-Minion' state.apply rsyslog.minion
salt '*' state.apply php
salt '*' state.apply apache2
salt 'Ubuntu-1710-Salty-Minion' state.apply mysql-client
