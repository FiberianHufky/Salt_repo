system:
  network.system:
    - enabled: True
    - hostname: {{ pillar.get('hostname') }}.{{ pillar.get('domain') }}
    - nisdomain: {{ pillar.get('domain') }}
    - apply_hostname: True
    - retain_settings: True
