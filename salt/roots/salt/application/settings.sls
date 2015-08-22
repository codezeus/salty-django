{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}
{% set app_name = salt['pillar.get']('app:vars:app_name') %}
{% set app_path = salt['pillar.get']('app:paths:src_dir') %}
{% set core_path = app_path ~ '/' ~ app_name %}
{% set settings_path = core_path ~ '/settings/local.py' %}

django_settings:
  file.managed:
    - name: {{ settings_path }}
    - source: salt://application/local.py.template
    - template: jinja
