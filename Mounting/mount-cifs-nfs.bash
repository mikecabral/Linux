```bash
sudo mount -t cifs -o username=i5 //192.168.x.x/paperless /media/paperless
```

```bash
sudo mount -t cifs -o credentials=~/.i5cred //192.168.x.x/paperless /media/paperless
```

```bash
sudo mount -t cifs -o credentials=/home/rhel/.i5cred,uid=1000,gid=1001,dir_mode=0755,file_mode=0755 //192.168.50.213/paperless_consume /media/paperless/consume
FSTAB
```

```bash
sudo mount -t cifs -o credentials=~/.i5cred,dir_mode=0755,file_mode=0755 //192.168.x.x/paperless_consume /media/paperless/consume
```

##### **Make a file called either .smb or smb.cred with the following information:**
user=USER
password=PASSWORD
domain=WORKGROUP

##### Fstab for CIFS
```bash
#i5 intel / paperless share
# <file system>             <dir>          <type> <options>                                                   <dump>  <pass>
//192.168.x.x/paperless_consume  /media/paperless/consume  cifs  credentials=/home/rhel/.i5cred,uid=1000,gid=1001,file_mode=0755,dir_mode=0755 0       0
```

##### Mount NFS and FSTAB
```bash
sudo mount -t nfs 192.168.x.x:/mnt/A/MP3 /media/music
```
OR
```bash
sudo mount -t nfs -o nfsvers=3 172.16.16.x:/mnt/A/MP3 /media/music
```
##### Fstab file
```bash
192.168.x.x:/mnt/A/MP3  /media/music nfs    defaults  0       0
```
##### Test to see if mounting works properly
```bash
sudo umount /media/music
```

```bash
sudo mount /media/music
```

##### Check if it's there mounted properly
```bash
df -h
```

##### Mount NFS Share WD MyCloud
```bash
mount -t nfs 192.168.x.x:/nfs/Public /media/mycloud/
```

##### Mount a cifs / samba share manually (ASKS FOR PASSWORD)
```bash
mount -t cifs -o username=backupcreator //192.168.x.x/e /media/backup_server
```

##### Mount a cifs / samba share manually (UNSECURE WAY)
```bash
mount -t cifs -o username=backupcreator,password=pioneer //192.168.x.x/e /media/backup_server
```

##### Mount a cifs /samba share automatically and persistent with fstab

##### Make a file called either **.smb** or **smb.cred** with the following information:
```bash
user=USER
password=PASSWORD
domain=WORKGROUP
```

Open **/etc/fstab** and place at the bottom
```bash
//192.168.x.x/e  /media/backup_server  cifs  credentials=/home/rockybackup/.smb  0 0
```

##### USE EXPLICIT MOUNTING COMMAND WITH BASH SCRIPT
```bash
mount -t cifs -o user=backupcreator,uid=1000,gid=1000 //192.168.x.x/e /media/backup_server 
```

##### Mount FTP as a LOCAL DIR
```bash
curlftpfs -o allow_other backupcreator:pioneer@192.168.x.x /home/rockybackup/ftp 
```
OR
```bash
fusermount -u /home/rockybackup/ftp
```

