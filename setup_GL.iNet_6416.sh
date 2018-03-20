#!/bin/sh
./scripts/feeds install libpam
./scripts/feeds install libgnutls
./scripts/feeds install libopenldap
./scripts/feeds install libssh2
./scripts/feeds install liblzma
./scripts/feeds install libidn
./scripts/feeds install libnetsnmp
./scripts/feeds install luci  
./scripts/feeds install adblock
./scripts/feeds install luci-app-adblock
#./scripts/feeds install tinc
# get tinc pre so you can use invites
rm -rf feeds/packages/net/tinc
git clone https://github.com/excogitation/openwrt-tinc-1.1.git
./scripts/feeds install tinc

./scripts/feeds install coreutils
./scripts/feeds install libpthread
./scripts/feeds install ecdsautils

./scripts/feeds install wget
#as the built-in wget doesn't work with adblock

