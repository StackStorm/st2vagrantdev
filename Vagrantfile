#-*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "private_network", ip: "192.168.50.25"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: "sudo apt-get update; sudo apt-get -y install python python-setuptools"

  config.vm.provision "ansible" do |ansible|
    ansible.config_file = "./ansible/ansible.cfg"
    ansible.playbook = "./ansible/main.yml"
  end

  # config.vm.synced_folder "../st2", "/home/vagrant/local/st2", type: "rsync", rsync__exclude: ["virtualenv/"]
end

