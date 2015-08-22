git_repo:
  pkgrepo.managed:
    - humanname: git-ppa-{{ grains['oscodename'] }}
    - name: deb http://ppa.launchpad.net/git-core/ppa/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/git-{{ grains['oscodename'] }}.list
    - dist: {{ grains['oscodename'] }}
    - keyid: E1DF1F24
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: git

git:
  pkg.installed
