##### create a 00-installer-config.yaml
```bash
	sudo nano /etc/netplan/01-netcfg.yaml
```

```yaml
network:
  renderer: networkd
  ethernets:
    eth0:
      addresses:
        - 192.168.50.239/24
      nameservers:
        addresses: [192.168.50.1]
      routes:
        - to: default
          via: 192.168.50.1
  version: 2
```

##### Apply settings
```bash
sudo netplan apply
```

##### Check connection to make sure it's working
```bash
ip addr show ens192
```
