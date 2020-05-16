# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "debian/buster64"
  config.vm.box_check_update = false

  config.vm.network "private_network", ip: "172.27.11.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = "2"
  end

  config.vm.provider "libvirt" do |lv|
    lv.memory = "2048"
    lv.cpus = "4"
    lv.cputopology :sockets => "1", :cores => "2", :threads => "2"
  end
  
  config.vm.provision "shell", path: "provision.sh"
end
