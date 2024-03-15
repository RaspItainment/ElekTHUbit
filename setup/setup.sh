#!/bin/bash

set -v
set -e

export DEBIAN_FRONTEND=noninteractive

sudo cp setup/debian.sources /etc/apt/sources.list.d/debian.sources

sudo -E apt update --yes
sudo -E apt upgrade --yes

cp setup/authorized_keys ~/.ssh/authorized_keys

sudo dd if=/dev/zero of=/swapfile bs=1M count=4096
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

sudo mkdir /mnt/platz
sudo mount /dev/vdb /mnt/platz
sudo chown -R debian /mnt/platz

mv ./raspberry-vanilla /mnt/platz
cd /mnt/platz/raspberry-vanilla
./build.sh
