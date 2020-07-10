include:
  - .composer
  - .php

install_laravel:
  cmd.run:
    - name: composer global require laravel/installer
    - creates: /root/.config/composer/vendor/bin/laravel
    - requires:
      - pkgs:
        - php7.3-cli
        - php7.3-zip
        - php7.3-mbstring
        - php7.3-xml
      - sls:
        - .composer
        - .php

init_laravel:
  cmd.run:
    - name: mkdir /root/laura && composer create-project --prefer-dist laravel/laravel /root/laura && php artisan key:generate
    - creates: /root/laura/artisan
