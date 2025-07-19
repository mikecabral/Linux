##### Mounting a Partition
```bash
mount -t file_system_type device mount_point
```
##### Example
```bash
mount -t ext /dev/sdb1 /mnt/extraspace/
```
**-o** option allows extra commands
**-o ro** – mounts partition as read only

##### Mount an ISO image
```bash
mount -o loop filename.iso mount_point
```

##### Mount an Optical Drive, CDs, DVDs or Blu-ray discs (UDF for Blu-ray only) if unsure, use auto.  
```bash
mount -t iso9660 device mount_point
```

```bash
mount -t iso9660 /dev/sr0 /media/dvd
```

##### Unmount a partition
```bash
umount /dev/sdb1 or umount /mnt/extraspace
```
