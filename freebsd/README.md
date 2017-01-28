FreeBSD 11.0 Setup
====

### Wireless Setup

#### Hardware

Intel Wireless-N 7260 (802.11bgn, not Dual Band version, 2.4G Hz only)

#### Wireless driver infomation

- iwm driver works: https://www.freebsd.org/cgi/man.cgi?query=iwm&sektion=4&manpath=freebsd-release-ports
- manually test the iwm driver
```
kldload if_iwm
ifconfig wlan0 create wlandev iwm0
ifconfig wlan0 up scan
ifconfig wlan0 list scan
```

#### Load iwm driver at boot time:
- /etc/rc.conf
```
wlans_iwm0="wlan0"
ifconfig_wlan0="WPA DHCP"
```
- /boot/loader.conf
```
if_iwm_load="YES"
iwm7260fw_load="YES"
```
- /etc/wpa_supplicant
```
ctrl_interface=/var/run/wpa_supplicant
eapol_version=2
ap_scan=1
fast_reauth=1

network={
        ssid="xxxx"
        psk="xxxx"
}
```

### Nginx Setup

#### nginx installation and configuration

```
pkg install nginx
echo 'nginx_enable="YES"' >> /etc/rc.conf
```
edit `/usr/local/etc/nginx/nginx.conf` following [nginx.conf](https://github.com/subbyte/configurations/blob/master/freebsd/nginx/nginx.conf)

#### Digitial certificate setup (Let's Encrypt)
- install certbot
```
pkg install py27-certbot
```

### OS Daily Update
```
freebsd-update fetch
freebsd-update install
```
