install_shells:
  pkg.installed:
    - pkgs:
{% for shell in pillar.get('shells') %}
      - {{ shell }}
{% endfor %}