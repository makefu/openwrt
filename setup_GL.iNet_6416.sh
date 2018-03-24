#!/bin/sh

./scripts/feeds update -a

install_feeds(){
  for i in "$@";do
    echo "Installing feed $i"
    ./scripts/feeds install $i
  done
}


install_feeds libpam libgnutls libopenldap libssh2 liblzma libidn libnetsnmp luci  adblock luci-app-adblock


# get tinc pre so you can use invites
pushd feeds/packages/net
rm -rf tinc
git clone https://github.com/excogitation/openwrt-tinc-1.1.git tinc
popd

install_feeds tinc

install_feeds coreutils libpthread ecdsautils luci-app-unbound unbound libunbound wget
