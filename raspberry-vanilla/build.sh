#!/bin/bash

set -v
set -e

export PATH="/sbin:$PATH"

sudo -E apt install repo bc coreutils dosfstools e2fsprogs fdisk kpartx mtools ninja-build pkg-config python3-pip --yes
sudo pip3 install meson mako jinja2 ply pyyaml dataclasses

repo init -u https://android.googlesource.com/platform/manifest -b android-14.0.0_r22 --depth=1

mkdir -p .repo/local_manifests
cp manifest_brcm_rpi.xml remove_projects.xml .repo/local_manifests/

repo sync -c -j 8

. build/envsetup.sh

lunch aosp_rpi4_car-userdebug

make bootimage systemimage vendorimage -j 8

./rpi4-mkimg.sh
