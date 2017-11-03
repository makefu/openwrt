#tinc-pre instructions from here:
https://github.com/awiouy/openwrt-tinc-1.1

rm -rf feeds/packages/net/tinc
git clone https://github.com/awiouy/openwrt-tinc-1.1 package/packages/tinc
./scripts/feeds install tinc
make package/tinc/compile

... changed to tinc pre15 in Makefile
make package/tinc/compile
make package/tinc/install


todo:
- adblock lists https://www.reddit.com/r/HomeNetworking/comments/692t70/router_adblock/
- include tinc-pre in firmware
- tinc-pre version fucked up. what happended?
- automatically join tinc with script (file of invites?)
tinc join <invitation-url>
invite file: files/etc/invites
