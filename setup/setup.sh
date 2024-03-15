#!/bin/bash

set -v
set -e

cp debian.sources /etc/apt/sources.list.d/debian.sources

sudo apt update --yes
sudo apt upgrade --yes

cp authorized_keys .ssh/authorized_keys

sudo mount /dev/vdb /mnt/vieeeeel-platz/
sudo swapon /mnt/vieeeeel-platz/swapfile
