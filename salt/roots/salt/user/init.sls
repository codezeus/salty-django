{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}

{{ group }}_group:
  group.present:
    - name: {{ group }}

{{ user }}_user:
  user.present:
    - name: {{ user }}
    - groups:
      - {{ group }}
