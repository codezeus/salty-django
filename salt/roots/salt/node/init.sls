{% set user = salt['pillar.get']('system:user') %}
{% set group = salt['pillar.get']('system:group') %}
{% set npm_dir = '/home/' ~ user ~ '/.npm' %}

nodejs_ppa:
  pkg.installed:
    - name: apt-transport-https
    - require_in:
      - pkgrepo: nodejs_ppa
  pkgrepo.managed:
    - humanname: NodeSource Node.js Repository
    - name: deb https://deb.nodesource.com/node_0.12 {{ grains['oscodename'] }} main
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/nodesource.list
    - keyid: "68576280"
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: nodejs

nodejs:
  pkg.installed:
    - name: nodejs
    - reload_modules: true
