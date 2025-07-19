#### Setup .smbcred file wherever you'd like
```bash
nano .smbcred
```

#### Enter the details
```bash
username=truenas user
password=truenas user password
domain=WORKGROUP #or whatever domain
```
#### Save and quit

#### Mount cifs smb share from TrueNAS to Linux OS
```bash
sudo mount -t cifs -o credentials=/home/zerocool/.smbcred //172.16.16.175/Jellyfin /media/Jellyfin
```

#### ADD the following to your fstab /etc/fstab
```bash
//172.16.16.175/Jellyfin /media/Jellyfin cifs credentials=/home/zerocool/.smbcred,uid=1000,gid=1000,vers=3.0 0 0
```

#### Test the mount by unmounting it and re-mounting it
```bash
sudo umount /media/Jellyfin
```

```bash
sudo mount /media/Jellyfin
```

#### If everything went smoothly, you can safely reboot the pc without worry

#### Backup's on Eugene (MASTER)
##### Orangefarm-LinuxBoxes-Gibson
```bash
sudo mount -t cifs -o credentials=/home/eugene/.smbcred //172.16.16.175/Backups /media/Backups
```

##### Fstab on Eugene (MASTER)
##### Orangefarm-LinuxBoxes-Gibson
```bash
//172.16.16.175/Backups /media/Backups cifs credentials=/home/eugene/.smbcred,uid=1000,gid=1000,vers=3.0 0 0
```

#### Backup's on Kate (ACIDBURN)
##### Orangefarm-LinuxBoxes-AcidBurn
```bash
sudo mount -t cifs -o credentials=/home/kate/.smbcred //172.16.16.175/Backups /media/Backups
```

##### Fstab on Kate (ACIDBURN)
##### Orangefarm-LinuxBoxes-AcidBurn
```bash
//172.16.16.175/Backups /media/Backups cifs credentials=/home/kate/.smbcred,uid=1000,gid=1000,vers=3.0 0 0
```

#### Backup's on Zerocool (CRASHOVERRIDE)
##### Orangefarm-LinuxBoxes-CrashOverride
```bash
sudo mount -t cifs -o credentials=/home/zerocool/.smbcred //172.16.16.175/Backups /media/Backups
```

##### Fstab on Zerocool (CRASHOVERRIDE)
##### Orangefarm-LinuxBoxes-CrashOverride
```bash
//172.16.16.175/Backups /media/Backups cifs credentials=/home/zerocool/.smbcred,uid=1000,gid=1000,vers=3.0 0 0
```

#### Backup's on Emmanuel (CEREALKILLER)
##### Orangefarm-LinuxBoxes-CerealKiller
```bash
sudo mount -t cifs -o credentials=/home/emmanuel/.smbcred //172.16.16.175/Backups /media/Backups
```

##### Fstab on Emmanuel (CEREALKILLER)
##### Orangefarm-LinuxBoxes-CerealKiller
```bash
//172.16.16.175/Backups /media/Backups cifs credentials=/home/emmanuel/.smbcred,uid=1000,gid=1000,vers=3.0 0 0
```
