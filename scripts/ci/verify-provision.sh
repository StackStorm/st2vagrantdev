#!/usr/bin/env bash

set -x
set -e

PYTHON_VERSION=$1
MONGODB_VERSION=$2

lsb_release -a

ls -la /home/vagrant/st2
ls -la /home/vagrant
ls -la /home/vagrant/.st2_bash_profile.sh

cat /home/vagrant/.bash_profile
cat /home/vagrant/.st2_python_binary

$(cat /home/vagrant/.st2_python_binary) --version --version ; dpkg -l | grep mongodb-org ; dpkg -l | grep redis-server ; dpkg -l | grep erlang-base ; dpkg -l | grep rabbitmq-server
$(cat /home/vagrant/.st2_python_binary) --version --version | grep "${PYTHON_VERSION}"

dpkg -l | grep mongodb-org | grep "${MONGODB_VERSION}"
dpkg -l | grep erlang-base | grep 23.3
dpkg -l | grep rabbitmq-server | grep 3.8

ps aux | grep mongodb | grep -v grep
ps aux | grep rabbitmq | grep -v grep
ps aux | grep redis-server | grep -v grep

sudo ls -la /home/stanley/.ssh
sudo ls -la /home/vagrant/.ssh
sudo ls -la /home/stanley/.ssh/authorized_keys
sudo ls -la /home/vagrant/.ssh/stanley_rsa

env
env | grep VIRTUALENV_DIR
env | grep VIRTUALENV_ST2CLIENT_DIR
env | grep VIRTUALENV_COMPONENTS_DIR
