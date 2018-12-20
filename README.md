# Stackstorm Vagrant Dev Environment

To quickly get bootstrapped run the following:

1. Clone repo
2. Execute `vagrant up` inside repo
3. Execute `vagrant ssh` inside repo
4. Execute `cd ~/st2` inside virtual machine
5. Execute `make requirements` inside `~/st2`
6. Execute `source virtualenv/bin/activate` inside `~/st2`
7. Execute `make cli` inside `~/st2`
8. Execute `./tools/launchdev.sh start -x` inside `~/st2`

You will likely from here want to share your local `st2` repo with the vagrant
image so migrate code more quickly. Do that by uncommenting the line in the
`Vagrantfile` to sync folder. This is set to `rsync` by default to avoid slow
disk performance with live sharing the local folder with the virtual machine. To
sync your changes execute `vagrant rsync` from within this repo.
