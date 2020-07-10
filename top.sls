base:
  '*':
    - states.network.set_hostname
    - states.init_minion
    - states.users.add_users
    - states.packages.shells
    - states.packages.sshd