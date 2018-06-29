rsyslog:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: rsyslog
      - file: /etc/rsyslog.d/master.conf

/etc/rsyslog.d/master.conf:
  file:
    - managed
    - source: salt://rsyslogmaster/master.conf
    - user: root
    - group: root
    - mode: 644
