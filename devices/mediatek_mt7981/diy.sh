#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

sed -i '/postgres=5432/d' feeds/packages.index
sed -i '/postgres=5432/d' feeds/packages/net/gnunet/Makefile
./scripts/feeds install -a

sed -i "s/make-ext4fs missing-macros/make-ext4fs meson missing-macros/" tools/Makefile
curl -sfL https://raw.githubusercontent.com/openwrt/openwrt/openwrt-23.05/include/meson.mk -o include/meson.mk
svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/tools/meson tools/meson

rm -rf package/feeds/kiddin9/rtl*

rm -rf devices/common/patches/{fix.patch,iptables.patch,kernel-defaults.patch,targets.patch}

sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2024-12-06/" package/network/config/netifd/Makefile

rm -rf toolchain/musl

svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/toolchain/musl toolchain/musl
