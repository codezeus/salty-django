{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}
{% set app_path = salt['pillar.get']('app:paths:src_dir') %}
{% set node_modules = app_path ~ '/node_modules' %}

include:
  - node

{{ node_modules }}:
  file.directory:
    - user: {{ user }}
    - group: {{ group }}
    - makedirs: True

install_global_npm_dependencies:
  cmd.run:
    - name: 'npm install -g gulp coffee-script'
    - user: root
    - require:
      - pkg: nodejs

npm_dependencies:
  cmd.run:
    - name: 'npm install'
    - user: {{ user }}
    - cwd: {{ app_path }}
    - require:
      - file: {{ node_modules }}
      - pkg: nodejs
