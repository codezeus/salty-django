{% set user = salt['pillar.get']('system:user') %}
{% set app_path = salt['pillar.get']('app:paths:src_dir') %}
{% set app_name = salt['pillar.get']('app:vars:app_name') %}
{% set settings_module = salt['pillar.get']('app:vars:settings_module') %}
{% set venv_dir = salt['pillar.get']('system:venv_dir') %}
{% set venv_path = venv_dir ~ app_name %}

include:
  - .settings
  - .frontend
  - postgresql
  - node

run_gulp:
  cmd.run:
    - name: 'gulp build'
    - user: {{ user }}
    - cwd: {{ app_path }}
    - require:
      - cmd: install_global_npm_dependencies
      - pkg: nodejs

django_collect_static:
  module.run:
    - name: django.collectstatic
    - bin_env: {{ venv_path }}
    - settings_module: {{ settings_module }}
    - pythonpath: {{ app_path }}
    - noinput: True
    - require:
      - virtualenv: {{ venv_path }}
      - postgres_database: postgresql_database_setup
      - file: django_settings
