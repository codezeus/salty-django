{% set fqdn = salt['grains.get']('fqdn', 'salt-dev') %}

system:
  user: vagrant
  group: vagrant
  hostname: {{ fqdn }}
  venv_dir: /web/envs/
postgresql:
  username: salt-user
  password: password
  database: project_db
  host: localhost
app:
  paths:
    src_dir: /web/project
  vars:
    app_name: project
    settings_module: project.settings
    secret_key: tdhnfln2mf4r$_oe=^3$q-0_9d1f(%n70(t@e=tytg==qdnpf9
