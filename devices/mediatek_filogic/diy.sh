#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

rm -rf tools/mkimage
svn co https://github.com/openwrt/openwrt/trunk/tools/mkimage tools/mkimage

curl -sfL https://raw.githubusercontent.com/openwrt/openwrt/master/scripts/mkits.sh -o scripts/mkits.sh