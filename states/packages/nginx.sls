install_nginx:
  pkg.installed:
    - pkgs:
      - nginx

nginx_service:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: '/etc/nginx/sites-enabled/catalina'
      - file: '/etc/nginx/sites-enabled/ioun'

nginx_catalina:
  file.managed:
    - source: salt://files/abe/nginx/catalina_entilly_com
    - name: '/etc/nginx/sites-enabled/catalina'

nginx_ioun:
  file.managed:
    - source: salt://files/abe/nginx/catalina_ioun_com
    - name: '/etc/nginx/sites-enabled/ioun'