#!/bin/bash

set -v
set -e

export PATH="/sbin:$PATH"

echo "Y" | repo init -u https://android.googlesource.com/platform/manifest -b android-14.0.0_r22 --depth=1

mkdir -p .repo/local_manifests
cp ./manifest_brcm_rpi.xml ./remove_projects.xml .repo/local_manifests/

repo sync -c -j 8

pushd ./hardware/interfaces/
git remote set-url aosp https://github.com/Raspitainment/custom-vhal.git
git fetch aosp
git add .
git reset --hard aosp/main
popd

. build/envsetup.sh

lunch aosp_rpi4_car-userdebug

make bootimage systemimage vendorimage -j 8

./rpi4-mkimg.sh
