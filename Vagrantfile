#-*- mode: ruby -*-
# vi: set ft=ruby :

# Valid values are 3.6 and 3.8
PYTHON_VERSION = "3.6"

# Valid values are 4.0 and 4.4
MONGODB_VERSION = "4.0"

ERLANG_VERSION = "1:23.3.1-1rmq1ppa1~ubuntu18.04.1"
RABBITMQ_VERSION = "3.8.14-1"

VM_NAME = "st2-dev-py-" + PYTHON_VERSION.sub( ".", "") + "-mongo-" + MONGODB_VERSION.sub(".", "")

ANSIBLE_DEBUG = ENV.has_key?('ANSIBLE_DEBUG') ? "vvv" : ""

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = VM_NAME

  config.vm.network "private_network", ip: "192.168.50.25"
  config.vm.network "forwarded_port", guest: 9101, host: 9101
  config.vm.network "forwarded_port", guest: 9100, host: 9100

  config.vm.provider "virtualbox" do |vb|
    # Modify those as you see fit
    vb.memory = 4096
    vb.cpus = 2
    vb.name = VM_NAME
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.config_file = "/vagrant/ansible/ansible.cfg"
    ansible.playbook = "/vagrant/ansible/main.yml"
    ansible.verbose = ANSIBLE_DEBUG
    ansible.extra_vars = {
      python_version: PYTHON_VERSION,
      mongodb_version: MONGODB_VERSION,
      rabbitmq_version: RABBITMQ_VERSION,
      erlang_version: ERLANG_VERSION,
    }
  end

  # config.vm.synced_folder "../st2", "/home/vagrant/loc../st2", type: "rsync", rsync__exclude: ["virtualenv/", "virtualenv*/"]
  # Or as an alternative, you can use NFS mounts which are faster and auto-sync
  # config.vm.synced_folder "../st2", "/home/vagrant/local/st2", type: "nfs", nfs_udp: false
end

