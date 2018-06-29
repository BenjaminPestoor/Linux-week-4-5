#!/bin/bash

#==============================================
#MASTER UPDATE / UPGRADE
#==============================================
  #Update
apt update -y
  #Upgrade
apt upgrade -y


  #installing salt-master / salt-minion with config
apt-get -y install salt-master
wget http://10.1.1.6/salt-master/salt-master/master.conf -O /etc/salt/master.d/master.conf
apt-get -y install salt-minion
wget http://10.1.1.6/salt-master/salt-minion/minion.conf -O /etc/salt/minion.d/minion.conf
  #restarting salt-master / salt-minion
service salt-master restart
service salt-minion restart
echo "it's time to restart salt-minion on minion"
sleep 10

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
mkdir -p /srv/salt/states/base/rsyslogmaster
mkdir -p /srv/salt/states/base/rsyslogminion
mkdir -p /srv/salt/states/base/snmp
mkdir -p /srv/salt/states/base/snmpd
mkdir -p /srv/salt/states/base/unzip
mkdir -p /srv/salt/states/base/wordpress

  #Salt Pillars directories
mkdir -p /srv/salt/pillars/
mkdir -p /srv/salt/pillars/base/

  #making salt directory
mkdir -p /var/www/html/cacti/
chmod 777 /var/www/html/cacti/

#==============================================
#MASTER SALT MYSQL / SALT MASTER
#==============================================
  #setting password mysql / rsyslog mysql / phpmyadmin
debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/setup-password password admin'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver select'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password admin'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password admin'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password admin'
debconf-set-selections <<< 'rsyslog-mysql rsyslog-mysql/dbconfig-upgrade select true'

#install needed programs
apt-get -y install apache2
apt-get -y install snmp
apt-get -y install snmpd
apt-get -y install unzip
apt install -y phpmyadmin
apt-get -y install php7.1-ldap
echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

  #installing mysql
apt-get -y install mysql-server
apt-get -y install rsyslog-mysql

echo "accepting salt keys"
  #accepting key salt-minion
salt-key list
salt-key -A -y

#==============================================
#INSTALL CACTI
#==============================================
wget http://10.1.1.6/salt-master/salt-master/cacti.zip
unzip cacti.zip -d /var/www/html/

service apache2 restart

  #creating database cacti
mysql --user="root" --password="admin" -e "CREATE DATABASE cacti"
#wget http://10.1.1.6/salt-master/salt-master/cacti.sql -O /var/www/html/cacti/cacti.sql
  #importing sql databse
mysql --user="root" --password="admin" --database="cacti" -e "source /var/www/html/cacti/cacti.sql"
chown -R root:www-data /var/www/html/cacti

#==============================================
#MASTER SALT STATE FILES FOR MINION
#==============================================
  #Downloading Apache2 init file
wget http://10.1.1.6/salt-master/apache2/init.sls -O /srv/salt/states/base/apache2/init.sls

  #Downloading mysql-client init file
wget http://10.1.1.6/salt-master/mysql-client/init.sls -O /srv/salt/states/base/mysql-client/init.sls

  #Downloading php init file
wget http://10.1.1.6/salt-master/php/init.sls -O /srv/salt/states/base/php/init.sls

  #Downloading rsyslog init file and config
wget http://10.1.1.6/salt-master/rsyslog.master/init.sls -O /srv/salt/states/base/rsyslogmaster/init.sls
wget http://10.1.1.6/salt-master/rsyslog.minion/init.sls -O /srv/salt/states/base/rsyslogminion/init.sls
wget http://10.1.1.6/salt-master/rsyslog.minion/remote.conf -O /srv/salt/states/base/rsyslogminion/remote.conf
wget http://10.1.1.6/salt-master/rsyslog.master/master.conf -O /srv/salt/states/base/rsyslogmaster/master.conf

  #Downloading snmp init file
wget http://10.1.1.6/salt-master/snmp/init.sls -O /srv/salt/states/base/snmp/init.sls

  #Downloading snmpd init file and config
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

salt-key list
echo "installing on multiple minions"

  #read top.sls and start salt
salt 'Ubuntu-1710-Salty-Minion' state.apply snmp
salt 'Ubuntu-1710-Salty-Minion' state.apply snmpd
salt 'Ubuntu-1710-Master-Salt-final' state.apply rsyslogmaster
salt 'Ubuntu-1710-Salty-Minion' state.apply rsyslogminion
salt 'Ubuntu-1710-Salty-Minion' state.apply php
salt 'Ubuntu-1710-Salty-Minion' state.apply apache2
salt 'Ubuntu-1710-Salty-Minion' state.apply mysql-client

service salt-master restart
service salt-minion restart

salt-key -A

salt 'Ubuntu-1710-Salty-Minion' state.apply snmp
salt 'Ubuntu-1710-Salty-Minion' state.apply snmpd
salt 'Ubuntu-1710-Master-Salt-final' state.apply rsyslogmaster
salt 'Ubuntu-1710-Salty-Minion' state.apply rsyslogminion
salt 'Ubuntu-1710-Salty-Minion' state.apply php
salt 'Ubuntu-1710-Salty-Minion' state.apply apache2
salt 'Ubuntu-1710-Salty-Minion' state.apply mysql-client

#==============================================
# WORDPRESS
#==============================================
wget http://10.1.1.6/salt-master/wordpress/init.sls -O /srv/salt/states/base/wordpress/init.sls
wget http://10.1.1.6/salt-master/wordpress/script.sh -O /srv/salt/states/base/wordpress/script.sh
salt 'Ubuntu-1710-Salty-Minion' state.apply wordpress
