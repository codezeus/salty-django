{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}
{% set hostname = salt['pillar.get']('system:hostname') %}
{% set app_name = salt['pillar.get']('app:vars:app_name') %}
{% set app_path = salt['pillar.get']('app:paths:src_dir') %}
{% set venv_dir = salt['pillar.get']('system:venv_dir') %}
{% set venv_path = venv_dir ~ app_name %}
{% set site_conf = '/etc/nginx/sites-available/' ~ hostname %}

include:
  - essential

nginx:
  pkg.installed

/etc/nginx/sites-available:
  file.directory:
    - user: {{ user }}
    - mode: 755
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled:
  file.directory:
    - user: {{ user }}
    - mode: 755
    - require:
      - pkg: nginx

{{ site_conf }}:
  file.managed:
    - source: salt://nginx/nginx.conf.template
    - user: {{ user }}
    - mode: 400
    - template: jinja
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled/{{ hostname }}:
  file.symlink:
    - target: {{ site_conf }}
    - require:
      - pkg: nginx
      - file: {{ site_conf }}

default-nginx:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx

{{ app_path }}/logs/nginx-access.log:
  file.managed:
    - user: {{ user }}
    - group: {{ group }}
    - require:
      - virtualenv: {{ venv_path }}
      - file: logs_dir

{{ app_path }}/logs/nginx-error.log:
  file.managed:
    - user: {{ user }}
    - group: {{ group }}
    - require:
      - virtualenv: {{ venv_path }}
      - file: logs_dir

start_nginx:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: /etc/nginx/sites-enabled/*
      - file: {{ site_conf }}
    - require:
      - pkg: nginx
      - file: {{ site_conf }}
