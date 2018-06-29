#!/bin/bash

mkdir -p /var/www/html/wordpress/
wget https://wordpress.org/wordpress-4.9.6.zip -O /var/www/html/wordpress/wordpress.zip
unzip /var/www/html/wordpress/wordpress.zip -d /var/www/html/wordpress/
apt install -y snmp
service apache2 restart
