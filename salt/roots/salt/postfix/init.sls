{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}

postfix:
  pkg.installed:
    - name: postfix
  service.running:
    - enable: True
    - require:
      - pkg: postfix

/etc/postfix:
  file.directory:
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

/etc/postfix/main.cf:
  file.managed:
    - source: salt://postfix/main.cf.template
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
    - mode: 644
    - require:
      - pkg: postfix
