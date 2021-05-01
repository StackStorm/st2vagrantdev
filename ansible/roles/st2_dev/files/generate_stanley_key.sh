#!/usr/bin/env bash

if [ -f "/home/stanley/.ssh/authorized_keys" ]; then
  echo "Key already exists, skipping thos step"
  exit 0
fi

echo "Generating stanley SSH key"
ssh-keygen -b 2048 -t rsa -f "/home/vagrant/.ssh/stanley_rsa" -q -N "" -m pem
mkdir -p /home/stanley/.ssh
chmod 660 /home/stanley/.ssh
chmod +x /home/stanley/.ssh
cp /home/vagrant/.ssh/stanley_rsa.pub /home/stanley/.ssh/authorized_keys
chmod 660 /home/stanley/.ssh/authorized_keys
chown -R stanley: /home/stanley/.ssh/
chown -R vagrant: /home/vagrant/.ssh/
