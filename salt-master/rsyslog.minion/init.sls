rsyslog:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: rsyslog
      - file: /etc/rsyslog.d/remote.conf

/etc/rsyslog.d/remote.conf:
  file:
    - managed
    - source: salt://rsyslogminion/remote.conf
    - user: root
    - group: root
    - mode: 644
