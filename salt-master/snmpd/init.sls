snmpd:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: snmpd
      - file: /etc/snmp/snmpd.conf

/etc/snmp/snmpd.conf:
  file:
    - managed
    - source: salt://snmpd/snmpd.conf
    - user: root
    - group: root
    - mode: 644


