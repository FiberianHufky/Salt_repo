install_composer:
  pkg.installed:
    - pkgs:
      - composer

export_composer_variable:
  environ.setenv:
    - name: COMPOSER_HOME
    - value: /root/.config/composer
    - update_minion: True