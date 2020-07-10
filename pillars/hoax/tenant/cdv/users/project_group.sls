cdv_users_projectgroup:
  
  
  jdoe:
    'full_name': 'John Doe'
    'name': 'jdoe'
    'shell': '/bin/zsh'
    'home': '/home/jdoe'
    'groups': ['sudo', 'accounting']
    'password': '$1$xm.'
    'keys': [{"owner": "John Doe", "key": "salt://files//cdv/person/really/pki/john_doe_maine_rsa.pub"}]

  jdoe2:
    'full_name': 'Jane Doe'
    'name': 'jdoe2'
    'shell': '/bin/bash'
    'home': '/home/jdoe2'
    'groups': ['sudo', 'developers']
    'password': '$1$xm.'
    'keys': [{"owner": "Jane Doe", "key": "salt://files//cdv/person/really/pki/jane_doe_maine_rsa.pub"}]
