{% set app_name = salt['pillar.get']('app:vars:app_name') %}

include:
  - gunicorn

supervisor:
  pkg:
    - installed
  service:
    - running

supervisord_conf:
  file.managed:
    - name: /etc/supervisor/conf.d/{{ app_name }}_gunicorn.conf
    - source: salt://supervisord/supervisord.conf.template
    - template: jinja

supervisored_gunicorn:
  supervisord.running:
    - name: {{ app_name }}_gunicorn
    - update: True
    - restart: True
    - watch:
      - file: supervisord_conf
      - file: application_script
    - require:
      - pkg: supervisor
