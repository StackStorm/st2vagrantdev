# Stackstorm Vagrant Dev Environment

[![Build Status](https://github.com/StackStorm/st2vagrantdev/actions/workflows/ci.yaml/badge.svg)](https://github.com/StackStorm/st2vagrantdev/actions/workflows/ci.yaml)

NOTE: This repository is for people working on (developing) StackStorm. End users and people who just want
to quickly try out and test StackStorm using Vagrant should use https://github.com/StackStorm/st2vagrant.

For more information, please refer to https://docs.stackstorm.com/install/vagrant.html.

## Getting Started

To quickly get bootstrapped run the following:

1. Clone your StackStorm/st2 git repo fork which you will use to develop and test on to ../st2
   (``git clone https://github.com/StackStorm/st2.git ../st2``)
2. Clone this repo
3. Execute `vagrant up` inside repo
4. Execute `vagrant ssh` inside repo
5. Execute `cd ~/local/st2` inside virtual machine
6. Execute `make requirements` inside `~/local/st2`
7. Execute `source virtualenv/bin/activate` inside `~/local/st2`
8. Execute `make cli` inside `~/local/st2`
9. Execute `./tools/launchdev.sh start -x` inside `~/local/st2`

You will likely from here want to share your local `st2` repo with the vagrant image to migrate code 
more quickly. To sync your changes execute `vagrant rsync` from within this repo. `vagrant rsync` command 
assumes that the local `st2` repo is accessible as `../st2`. 

As an alternative (per example in Vagrantfile), you can also use nfs mount where changes are
automatically reflected inside the virtual machine immediately after you make them on host.

Note: Make sure to run step 5 (`make requirements`) inside `~/local/st2` instead of `~/st2` to have the `PYTHONPATH` point to the modules inside `~/st2/local/st2`.

### Specifying a Python and MongoDB version

By default, the image is provisioned using Python 3.6 and Mongo DB 4.0. If you want to us Python
3.8 and MongoDB 4.4 you can do that editing corresponding variables in ``Vagrantfile`` before
running ``vagrant up`` / ``vagrant provision``.

For example:

```ruby
...
PYTHON_VERSION = "3.8"
MONGODB_VERSION = "4.4"
...
```

Keep in mind that re-provisioning an existing VM with a different version of Python or MongoDB is
not supported.

If you want to change the version or develop on multiple different versions, you should just create
a new vagrant VM.

If you want to enable ansible debug logging for the provision step, you can do that by setting
``ANSIBLE_DEBUG`` environment variable as shown below.

```bash
ANSIBLE_DEBUG=1 vagrant provision
```

### Installed Versions of Software

Right now the following versions of software are installed during provisioning:

* Python 3.6
* RabbitMQ 3.8
* Erlang 1.23.3
* MongoDB 4.0
* Redis 6.0
* Nginx 1.10
