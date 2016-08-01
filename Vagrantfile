# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "insaneworks/centos"
  config.vm.provision :chef_zero do |chef|
    chef.cookbooks_path = "cookbooks","site-cookbooks"
    chef.nodes_path = "nodes"
    chef.add_recipe "docker"
  end
  config.vm.provision :shell, inline: <<-EOS
    /vagrant/mkimage-yum.sh insaneworks/centos
  EOS
end
