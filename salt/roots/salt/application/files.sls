{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}
{% set app_name = salt['pillar.get']('app:vars:app_name') %}
{% set app_path = salt['pillar.get']('app:paths:src_dir') %}
{% set venv_dir = salt['pillar.get']('system:venv_dir') %}
{% set venv_path = venv_dir ~ app_name %}

{{ app_path }}/logs/django.log:
  file.managed:
    - user: {{ user }}
    - group: {{ group }}
    - require:
      - virtualenv: {{ venv_path }}
