include:
  - states.users.add_users

ssh:
  pkg.installed


sshd_config:
  file:
    - managed
    - name: /etc/ssh/sshd_config
    - source: salt://files/templates/sshd_config
    - template: jinja
    - require:
      - sls: states.users.add_users

sshd_service:
  service.running:
    - name: sshd
    - enable: True
    - reload: True
    - watch:
      - file: '/etc/ssh/sshd_config'