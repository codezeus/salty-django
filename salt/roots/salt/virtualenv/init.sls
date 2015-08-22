{% set user = salt['pillar.get']('system:user') %}
{% set app_path = salt['pillar.get']('app:paths:src_dir') %}
{% set app_name = salt['pillar.get']('app:vars:app_name') %}
{% set venv_dir = salt['pillar.get']('system:venv_dir') %}
{% set reqs_file = app_path ~ '/requirements/base.pip' %}
{% set venv_path = venv_dir ~ app_name %}

python-virtualenv:
  pkg.installed

{{ venv_path }}:
  virtualenv.managed:
    - system_site_packages: False
    - user: {{ user }}
    - requirements: {{ reqs_file }}
    - no_chown: True
