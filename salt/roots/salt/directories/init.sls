{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}
{% set project_name = salt['pillar.get']('app:vars:app_name') %}
{% set venv_dir = salt['pillar.get']('system:venv_dir') %}

include:
  - essential

app_dir:
  file.directory:
    - name: /web/{{ project_name }}
    - user: {{ user }}
    - group: {{ group }}
    - require:
      - pkg: essential_pkgs

logs_dir:
  file.directory:
    - name: /web/{{ project_name }}/logs
    - user: {{ user }}
    - group: {{ group }}
    - require:
      - file: app_dir
