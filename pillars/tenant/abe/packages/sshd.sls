sshd_server_config:
  - ['ChallengeResponseAuthentication', 'no']
  - ['UsePam', 'yes']
  - ['X11Forwarding', 'no']
  - ['PrintMotd', 'no']
  - ['AcceptEnv', 'LANG LC_*']
  - ['PasswordAuthentication', 'no']
  - ['PermitRootLogin', 'without-password']