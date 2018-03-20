./scripts/feeds/install <package> makes it available in menuconfig.
The packge then needs to be selected in menuconfig to be included in the actual build.

as sometimes things get fucked up...
setup_GL.iNet_6416.sh is your friend.

config needs:
luci
luci-app-adblock
adblock
wget (not built-in)
libustream-mbedtls (or libustream-openssl or libustream-wolfssl - luci-ssl uses mbedtls so if that is used than no choice)
ca-certificates
ca-bundle
tinc

Benchmarking
libustream-openssl
	74s uclient-fetch:
	Fri Mar  9 00:30:18 2018 user.info adblock-[3.5.1]: start adblock processing (reload)
	Fri Mar  9 00:31:32 2018 user.info adblock-[3.5.1]: blocklist with overall 47893 domains loaded successfully (GL-iNet 6416A v1, OpenWrt SNAPSHOT r6129+10-0f063f8ac7)

	72s wget (not busybox)
	Fri Mar  9 00:33:01 2018 user.info adblock-[3.5.1]: start adblock processing (reload)
	Fri Mar  9 00:34:13 2018 user.info adblock-[3.5.1]: blocklist with overall 47893 domains loaded successfully (GL-iNet 6416A v1, OpenWrt SNAPSHOT r6129+10-0f063f8ac7)
libustream-mbedtls
	69s uclient-fetch
	Fri Mar  9 01:52:24 2018 user.info adblock-[3.5.1]: start adblock processing (reload)
	Fri Mar  9 01:53:33 2018 user.info adblock-[3.5.1]: blocklist with overall 47904 domains loaded successfully (GL-iNet 6416A v1, OpenWrt SNAPSHOT r6129+10-0f063f8ac7)

	73s wget (not busybox)
	Fri Mar  9 01:50:46 2018 user.info adblock-[3.5.1]: start adblock processing (reload)
	Fri Mar  9 01:51:59 2018 user.info adblock-[3.5.1]: blocklist with overall 47904 domains loaded successfully (GL-iNet 6416A v1, OpenWrt SNAPSHOT r6129+10-0f063f8ac7)
libustream-wolfssl
	87s uclient-fetch
        Fri Mar  9 13:12:59 2018 user.info adblock-[3.5.1]: start adblock processing (reload)
	Fri Mar  9 13:14:26 2018 user.info adblock-[3.5.1]: blocklist with overall 48029 domains loaded successfully (GL-iNet 6416A v1, OpenWrt SNAPSHOT r6129+10-0f063f8ac7)
	
78s wget (not busybox)
	Fri Mar  9 12:24:47 2018 user.info adblock-[3.5.1]: start adblock processing (reload)
	Fri Mar  9 12:26:05 2018 user.info adblock-[3.5.1]: blocklist with overall 48024 domains loaded successfully (GL-iNet 6416A v1, OpenWrt SNAPSHOT r6129+10-0f063f8ac7)


#/etc/rc.button
BTN_1 needs
chmod +x
but doesn't carry it over ?!


todo:
- adblock lists https://www.reddit.com/r/HomeNetworking/comments/692t70/router_adblock/

+#define GL_INET_GPIO_BTN_ADBLOCK       20 (rechts neben eckig)

cp letbox:openwrt/bin/ar71xx/openwrt-ar71xx-generic-gl-inet-6408A-v1-squashfs-sysupgrade.bin .


- upgrade in bin/upgrade pulls firmware from letbox
- password in files/etc/shadow (minikrebs)


/etc/firstrun.d/
adblock
	/etc/init.d/adblock start
	/etc/init.d/adblock enable

todo

wlan config adblock z.b.


GPIO Header: outside to inside

https://revspace.nl/images/thumb/d/d8/Glinet-pinout.png/300px-Glinet-pinout.png
GND, 20, 19, 18, 22, 21


Button LED an GPIO 19
GPIO kann max 24mA [https://www.openhacks.com/uploadsproductos/ar9331_datasheet.pdf] S 306

echo 19 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio19/direction 
echo 1 > /sys/class/gpio/gpio19/value


Button an GPIO 20
echo 20 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio20/direction
cat /sys/class/gpio/gpio20/value

# Connect to luci from tinc

ssh -L 8001:192.168.8.1:80 10.11.0.102
