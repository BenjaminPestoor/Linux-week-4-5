compile_and_install:
  cmd.script:
    - source: salt://wordpress/script.sh
    - user: root
    - group: root
    - shell: /bin/bash
