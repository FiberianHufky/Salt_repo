base:
  '*':
    - tenant.abe.users.expositors
    - salt.salt-master

  'G@tenant:cdv':
    - tenant.cdv.users.project_group
    - tenant.cdv.packages.shells
    - tenant.abe.network.domain_entilly_com
    - tenant.cdv.packages.sshd
  
  'G@tenant:abe':
    - tenant.abe.packages.shells
    - tenant.abe.network.domain_entilly_com
    - tenant.abe.packages.sshd

  'maea':
    - tenant.abe.hosts.maea.network.hostname

  'laura':
    - tenant.cdv.hosts.laura.network.hostname

  'catalina':
    - tenant.abe.hosts.catalina.network.hostname