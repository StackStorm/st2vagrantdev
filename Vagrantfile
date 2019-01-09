#-*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "private_network", ip: "192.168.50.25"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get -y install python python-setuptools
  SHELL

  config.vm.provision "ansible_local" do |ansible|
    ansible.config_file = "/vagrant/ansible/ansible.cfg"
    ansible.playbook = "/vagrant/ansible/main.yml"
  end

  config.vm.synced_folder "../st2", "/home/vagrant/local/st2", type: "rsync", rsync__exclude: ["virtualenv/"]
end

