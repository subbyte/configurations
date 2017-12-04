FreeBSD 11.0 Setup
====

wireless, nginx, sshd, firewall

### Wireless Setup

#### Hardware

Intel Wireless-N 7260 (802.11bgn, not Dual Band version, 2.4G Hz only)

#### Wireless driver infomation

- `iwm` driver works: https://www.freebsd.org/cgi/man.cgi?query=iwm&sektion=4&manpath=freebsd-release-ports
- manually test the `iwm` driver
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
- install `certbot`
```
pkg install py27-certbot
```

- miragting from old server
  - copy `/usr/local/etc/letsencrypt` to new server with links preserved
  - copy `/etc/ssl/certs` to the new server (`dhparam.pem`)
  - copy `/srv/www` and `/srv/empty` to the new server

- test `certbot`
```
certbot renew --dry-run
```

### sshd Setup
- /etc/ssh/sshd_config
```
Protocol 2
AllowUsers xxx yyy
LoginGraceTime 2m
PermitRootLogin no
StrictModes yes
MaxAuthTries 6
MaxSessions 20

# sftp
Match User yyy
    PasswordAuthentication yes
    ChrootDirectory /var/sftp
    ForceCommand internal-sftp
    AllowTcpForwarding no
    AllowAgentForwarding no
    PermitTunnel no
    PermitTTY no
    X11Forwarding no
```

### sftp Setup
- `adduser` `yyy` with `home` as `/nonexistent` and `shell` as `nologin`
- create chrootdir `/var/sftp` owned by `root:root` (for chroot to work)
- create dir inside `/var/sftp` owned by `yyy` for writing permission

### Firewall Setup
This rule blocks a IP for 1 hour if it connects to `sshd` service more than 3 times per minute
- install `expiretable`
```
pkg install expiretable
```
- /etc/pf.conf
```
pass quick inet proto tcp \
  from 10.0.0.0/16 to any port ssh

table <bruteforce> persist
block quick from <bruteforce>
pass inet proto tcp from any to any port ssh \
  flags S/SA keep state \
  (max-src-conn 3, max-src-conn-rate 4/60, \
  overload <bruteforce> flush global)
```
- setup pf and expiretable in `/etc/rc.conf`
```
# firewall with ssh bruteforce rules enforced
pf_enable="YES"
pf_rules="/etc/pf.conf"
pflog_enable="YES"
# clear older-than-hour IPs from PF bruteforce table
expiretable_enable="YES"
expiretable_flags="-v -d -t 1h bruteforce"
```

### OS Daily Update
```
pkg upgrade
freebsd-update fetch
freebsd-update install
```
