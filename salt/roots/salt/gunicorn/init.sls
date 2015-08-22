{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}
{% set app_path = salt['pillar.get']('app:paths:src_dir') %}
{% set app_name = salt['pillar.get']('app:vars:app_name') %}
{% set venv_dir = salt['pillar.get']('system:venv_dir') %}
{% set venv_path = venv_dir ~ app_name %}

include:
  - essential

application_script:
  file.managed:
    - name: {{ venv_path }}/bin/gunicorn.sh
    - source: salt://gunicorn/application.sh.template
    - template: jinja
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}
    - require:
      - virtualenv: {{ venv_path }}

{{ app_path }}/logs/gunicorn_supervisor.log:
  file.managed:
    - user: {{ user }}
    - group: {{ group }}
    - require:
      - virtualenv: {{ venv_path }}
      - file: logs_dir
