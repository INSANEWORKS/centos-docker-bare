# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "insaneworks/centos"
  config.vm.provision :shell, inline: <<-EOS
    yum -y install epel-release
    yum -y install docker-io
    /vagrant/mkimage-yum.sh insaneworks/centos
  EOS
end
