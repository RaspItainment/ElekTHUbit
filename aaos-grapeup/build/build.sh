#!/bin/bash

set -v
set -e

export PATH="/sbin:$PATH"

echo "Y" | repo init -u https://android.googlesource.com/platform/manifest -b android-13.0.0_r35 --depth=1

mkdir -p .repo/local_manifests
cp ./manifest_brcm_rpi4.xml ./remove_projects.xml .repo/local_manifests/

repo sync -j 8

. build/envsetup.sh

lunch aosp_rpi4-userdebug

make bootimage systemimage vendorimage -j 8

./rpi4-mkimg.sh
