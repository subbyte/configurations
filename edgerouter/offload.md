# Offload Option

### Problem

VLAN offloading was not turned on by default, which results in 150 Mbps cap
(100% CPU) Wifi speed via VLAN.

### Solution

1) ssh into edgerouter

2) check offload option
```
show ubnt offload
```

3) enable offload for IPv4 forwarding offload and VLAN offload
```
configure

set system offload ipv4 forwarding enable
set system offload ipv4 vlan enable

commit ; save

exit
```
