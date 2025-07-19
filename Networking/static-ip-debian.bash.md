#### Edit /etc/network/interfaces

# The primary network interface
```bash
#allow-hotplug ens192
#auto ens192
iface ens192 inet static
address 192.168.x.x
netmask 255.255.255.0
gateway 192.168.x.x
dns-nameservers 8.8.8.8
```

##### to enable DHCP add to /etc/network/interfaces

```bash
iface ens192 inet dhcp
```
THEN
```bash
sudo dhclient eth0
```
