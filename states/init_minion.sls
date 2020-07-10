include:
  - states.network.set_hostname
  - states.packages.python3-apt

{% set repo = salt['grains.filter_by']
({

'9':
{
'repo_key': 'https://repo.saltstack.com/py3/debian/9/amd64/3001/SALTSTACK-GPG-KEY.pub',
'source': 'deb http://repo.saltstack.com/py3/debian/9/amd64/3001 stretch main'
},

'10':
{
'repo_key': 'https://repo.saltstack.com/py3/debian/10/amd64/3001/SALTSTACK-GPG-KEY.pub',
'source': 'deb http://repo.saltstack.com/py3/debian/10/amd64/3001 buster main'
}

}, grain='osmajorrelease')
%}


set_saltstack_repo:
  pkgrepo.managed:
    - humanname: saltstack_repo
    - name: {{ repo['source'] }}
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: {{ repo['repo_key'] }}
    - refresh: True
    - require: 
      - sls: states.packages.python3-apt


salt-minion:
  pkg.installed


salt_config:
  file.managed:
    - name: '/etc/salt/minion'
    - contents: |
        master: {{ pillar.get('salt-master') }}


salt_minion_id:
  file.managed:
    - name: '/etc/salt/minion_id'
    - contents: |
        {{ pillar.get('hostname') }}


salt_service:
  service.running:
    - name: salt-minion
    - enable: True
    - full_restart: True
    - watch:
      - file: '/etc/salt/minion'
      - file: '/etc/salt/minion_id'
    