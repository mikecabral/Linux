**systemd** uses '**targets**' instead of **runlevels**. By default, there are two main targets:
**multi-user.target**: analogous to **runlevel 3**
**graphical.target**: analogous to **runlevel 5**

##### To view **current default target**, run:
```bash
systemctl get-default
```

To **set** a **default target**, run:  
```bash
systemctl set-default TARGET.target
```

### Systemctl Commands


##### Start Service
```bash
systemctl start service_name
```
##### Stop Service
```bash
systemctl stop service_name
```
##### Restart Service
```bash
systemctl restart service_name
```
##### Status of Service
```bash
systemctl status service_name
```
##### Reload Services. After you make changes
```bash
systemctl daemon-reload
```
##### Enable Service. Start at Bootup
```bash
systemctl enable service_name
```
##### Check if Service IS Enabled
```bash
systemctl is-enabled service_name
```
##### Diable Service From Starting at Boot
```bash
systemctl disable service_name
```
