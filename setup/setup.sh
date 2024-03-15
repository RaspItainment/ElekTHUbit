#!/bin/bash

set -v
set -e

export DEBIAN_FRONTEND=noninteractive

sudo cp setup/debian.sources /etc/apt/sources.list.d/debian.sources

sudo -E apt update --yes
sudo -E apt upgrade --yes

cp setup/authorized_keys ~/.ssh/authorized_keys

sudo mount /dev/vdb /mnt/vieeeeel-platz/
sudo swapon /mnt/vieeeeel-platz/swapfile
