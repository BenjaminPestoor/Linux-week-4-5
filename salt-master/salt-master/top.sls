base:
  'Ubuntu-1710-Master-Salt-final':
    - snmp
    - snmpd
    - rsyslogmaster
    - mysql-client
    - php
    - apache2

base:
  'Ubuntu-1710-Salty-Minion':
    - snmp
    - snmpd
    - rsyslogminion
    - mysql-client
    - php
    - apache2


