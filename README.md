# Stackstorm Vagrant Dev Environment

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
