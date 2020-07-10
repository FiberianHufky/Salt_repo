{% for key in pillar.keys() %}
{% if "users" in key %}
{% for entry in pillar.get(key) %}
{% set user = salt['pillar.fetch'](key + ':' + entry) %}

{% set pki_set = user.get('keys') %}

{{ user.name }}_||_{{ key }}:
  user.present:
  - name: {{ user.name }}
  - fullname: {{ user.full_name }}
  - home: {{ user.home }}
  - shell: {{ user.shell }}
  - groups:
{% for group in user.groups %}
    - {{ group }}
{% endfor %}
  - password: {{ user.password }}
  
{% for pki in pki_set %}

{{ user.name }}_user_{{ pki.owner }}_key:

  ssh_auth.present:
  - user: {{ user.name }}
  - source: {{ pki.key }}

{% endfor %}

{% endfor %}
{% endif %}
{% endfor %}
