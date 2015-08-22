{% set user = salt['pillar.get']('system:user') %}
{% set app_path = salt['pillar.get']('app:paths:src_dir') %}
{% set app_name = salt['pillar.get']('app:vars:app_name') %}
{% set settings_module = salt['pillar.get']('app:vars:settings_module') %}
{% set venv_dir = salt['pillar.get']('system:venv_dir') %}
{% set venv_path = venv_dir ~ app_name %}
{% set django_run = venv_path ~ '/bin/django-admin.py' %}

include:
  - .settings
  - postgresql

django_makemigrations:
  cmd.run:
    - name: '{{ django_run }} makemigrations'
    - user: {{ user }}
    - cwd: {{ app_path }}
    - env:
      - DJANGO_SETTINGS_MODULE: {{ settings_module }}
      - PYTHONPATH: $PYTHONPATH:{{ app_path }}
    - require:
      - virtualenv: {{ venv_path }}
      - postgres_database: postgresql_database_setup
      - file: django_settings

django_migrate:
  cmd.run:
    - name: '{{ django_run }} migrate'
    - user: {{ user }}
    - cwd: {{ app_path }}
    - env:
      - DJANGO_SETTINGS_MODULE: {{ settings_module }}
      - PYTHONPATH: $PYTHONPATH:{{ app_path }}
    - require:
      - virtualenv: {{ venv_path }}
      - postgres_database: postgresql_database_setup
      - file: django_settings
      - cmd: django_makemigrations
