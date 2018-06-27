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

  #Salt Pillars directories
mkdir -p /srv/salt/pillars/
mkdir -p /srv/salt/pillars/base/

mkdir -p /var/www/html/cacti

#==============================================
#MASTER SALT INSTALL CACTI / MYSQL / SALT MASTER
#==============================================
  #setting password mysql install
debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin'
  #installing mysql
apt-get -y install mysql-server

  #installing salt-master / salt-minion with config
apt-get -y install salt-master
wget http://10.1.1.6/salt-master/salt-master/master.conf -O /etc/salt/master.d/master.conf
apt-get -y install salt-minion
wget http://10.1.1.6/salt-master/salt-minion/minion.conf -O /etc/salt/minion.d/minion.conf
  #restarting salt-master / salt-minion
service salt-master restart
service salt-minion restart

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

  #creating database cacti
mysql --user="root" --password="admin" -e "CREATE DATABASE cacti"
wget http://10.1.1.6/salt-master/cacti/cacti.sql -O /var/www/html/cacti/cacti.sql
  #importing sql databse
mysql --user="root" --password="admin" --database="cacti" -e "source /var/www/html/cacti/cacti.sql"

  #downloading cacti 1.1.18 / copying cacti to webserver
wget https://www.cacti.net/downloads/cacti-1.1.18.tar.gz
tar xfz cacti-1.1.18.tar.gz
cp -rf cacti-1.1.18/* /var/www/html/cacti

  #downloading settings file cacti / activating log
touch /var/www/html/log/cacti.log
wget http://10.1.1.6/salt-master/cacti/config.php -O /var/www/html/cacti/include/config.php

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

  #Downloading top.sls config
wget http://10.1.1.6/salt-master/salt-master/top.sls -O /srv/salt/states/base/top.sls

#==============================================
#MINION SALT INSTALL SNMP, SNMPD, RSYSLOG, MYSQL-CLIENT, PHP & APACHE2 + ALL SETTINGS FOR LOGGING AND MONITORING
#==============================================
  #restarting salt-services
service salt-master restart
service salt-minion restart

  #read top.sls and start salt
#salt '*' state.highstate
