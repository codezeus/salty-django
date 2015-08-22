{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}
{% set db_user = salt['pillar.get']('postgresql:username') %}
{% set db_pass = salt['pillar.get']('postgresql:password') %}
{% set db_name = salt['pillar.get']('postgresql:database') %}

include:
  - essential

postgresql:
  pkg.installed:
    - names:
      - libpq-dev
      - postgresql-9.3
    - require:
      - pkg: essential_pkgs

  service.running:
    - watch:
      - file: /etc/postgresql/9.3/main/pg_hba.conf
    - require:
      - pkg: postgresql

  file.managed:
    - name: /etc/postgresql/9.3/main/pg_hba.conf
    - source: salt://postgresql/pg_hba.conf.template
    - template: jinja
    - user: {{ user }}
    - group: {{ group }}
    - mode: 644
    - require:
      - pkg: postgresql

postgresql_database_setup:
  postgres_user.present:
    - name: {{ db_user }}
    - password: {{ db_pass }}
    - createdb: True
    - user: postgres
    - require:
      - service: postgresql

  postgres_database.present:
    - name: {{ db_name }}
    - encoding: UTF8
    - lc_ctype: en_US.UTF8
    - lc_collate: en_US.UTF8
    - template: template0
    - owner: {{ db_user }}
    - user: postgres
    - require:
      - postgres_user: postgresql_database_setup
