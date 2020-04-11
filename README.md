# Stackstorm Vagrant Dev Environment

NOTE: This repository is for people working on (developing) StackStorm. End users and people who just want
to quickly try out and test StackStorm using Vagrant should use https://github.com/StackStorm/st2vagrant.

For more information, please refer to https://docs.stackstorm.com/install/vagrant.html.

## Getting Started

To quickly get bootstrapped run the following:

1. Clone repo
2. Execute `vagrant up` inside repo
3. Execute `vagrant ssh` inside repo
4. Execute `cd ~/st2` inside virtual machine
5. Execute `make requirements` inside `~/st2`
6. Execute `source virtualenv/bin/activate` inside `~/st2`
7. Execute `make cli` inside `~/st2`
8. Execute `./tools/launchdev.sh start -x` inside `~/st2`

You will likely from here want to share your local `st2` repo with the vagrant image to migrate code 
more quickly. To sync your changes execute `vagrant rsync` from within this repo. `vagrant rsync` command 
assumes that the local `st2` repo is accessible as `../st2`. 

Note: Make sure to run step 5 (`make requirements`) inside `~/local/st2` instead of `~/st2` to have the `PYTHONPATH` point to the modules inside `~/st2/local/st2`.