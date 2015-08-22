# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Using Ubuntu 14.04
  config.vm.box = 'ubuntu/trusty64'

  # Set the box id and memory
  config.vm.provider :virtualbox do |v|
    v.customize ['modifyvm', :id, '--name', 'salt-dev']
    v.customize ['modifyvm', :id, '--memory', 1024]
  end

  # Set the hotname and private network address
  config.vm.hostname = 'salt-dev'
  config.vm.network :private_network, ip: '1.2.3.4'

  # Set synced folders
  config.vm.synced_folder 'application/', '/web/'
  config.vm.synced_folder 'salt/roots/', '/srv/'

  # Use SaltStack to provision
  config.vm.provision 'salt', run: 'always' do |salt|
      salt.minion_config = 'salt/minion'
      salt.install_type = 'daily'
      salt.run_highstate = true
      salt.verbose = true
  end
end
