#### Mount TrueNAS Samba Share
```bash
sudo mount -t cifs -o credentials=/home/flex/.smbcred //172.16.16.175/Chia/TrueNAS /media/Chia
```
THEN
#### Edit your /etc/fstab
```bash
//172.16.16.175/Chia/TrueNAS /media/Chia cifs credentials=/home/flex/.smbcred,uid=1000,gid=1000,vers=3.0 0 0
```
##### Save and exit

#### Unmount and Mount test before rebooting
```bash
sudo umount /media/Chia
```
THEN
```bash
sudo mount /media/Chia
```


#### Mount WDMyCloud NFS Share
```bash
sudo mount -t nfs 172.16.16.148:/nfs/Public/WDMyCloud /media/Chia2
```
AND
```bash
sudo mount -t nfs 172.16.16.148:/nfs/Public2/WDMyCloud /media/Chia3
```
THEN
#### Edit your /etc/fstab
```bash
172.16.16.148:/nfs/Public/WDMyCloud /media/Chia2 nfs rw,user,noauto,_netdev 0 0
172.16.16.148:/nfs/Public2/WDMyCloud /media/Chia3 nfs rw,user,noauto,_netdev 0 0
```
##### Save and exit

#### Unmount and Mount test before rebooting
```bash
sudo umount /media/Chia2
```
THEN
```
sudo mount /media/Chia2
```

#### Test second drive
```bash
sudo umount /media/Chia3
```
THEN
```
sudo mount /media/Chia3
