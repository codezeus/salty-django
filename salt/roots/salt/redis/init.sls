{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}

include:
  - user

redis-server:
  pkg.installed

redis_group:
  group.present:
    - name: redis
    - addusers:
      - {{ user }}
    - require:
      - pkg: redis-server
      - user: {{ user }}_user

/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/redis.conf.template
    - user: {{ user }}
    - group: redis
    - template: jinja
    - mode: 644
    - require:
      - pkg: redis-server
