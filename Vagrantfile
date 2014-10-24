# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "puphpet/centos65-x64"
  config.vm.box_url = "puphpet/centos65-x64"
  config.vm.network :private_network, ip: "192.168.56.103"
  
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "project.pp"
    puppet.options = [
        #'--verbose',
        #'--debug',
    ]
  end
end
