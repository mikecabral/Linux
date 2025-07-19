                     ```bash
Device         Boot   Start      End  Sectors  Size Id Type
/dev/mmcblk1p1 *       2048  1050623  1048576  512M  b W95 FAT32
/dev/mmcblk1p2      1052670 30775295 29722626 14.2G  5 Extended
/dev/mmcblk1p5      1052672  2549759  1497088  731M 83 Linux
/dev/mmcblk1p6      2551808 30775295 28223488 13.5G 83 Linux


Disk /dev/mapper/mmcblk1p6_crypt: 13.45 GiB, 14433648640 bytes, 28190720 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/vgbodhi-root: 12.47 GiB, 13375635456 bytes, 26124288 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/vgbodhi-swap_1: 976 MiB, 1023410176 bytes, 1998848 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

##### To List Disks
```bash
fdisk -l
```

```
// the sd card to copy to

Disk /dev/mmcblk0: 14.86 GiB, 15931539456 bytes, 31116288 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x01078a8d
```

##### Copy Entire OS to USB command
```bash
dd if=/dev/mmcblk1 of=/media/amnesia/ad4746be-e769-48ec-959b-504e64705df0/bodhi_backup_2022.iso bs=64K conv=noerror,sync status=progress
```

##### Compress Entire OS into GZ format to save space (this didn't work in Bodhi) permission denied.
```bash
dd if=/dev/mmcblk1 | gzip -c > /media/amnesia/ad4746be-e769-48ec-959b-504e64705df0/bodhi_backup_2022.img.gz
```

##### Compress the Image File After the fact
```bash
gzip -c bodhi_backup_2022.img.gz
```

```bash
gzip -c bodhi_backup_2022.img >> bodhi_backup_2022.img.gz
```
##### Restoring a Drive with DD
```bash
dd if=/media/amnesia/ad4746be-e769-48ec-959b-504e64705df0/bodhi_backup_2022.img of=/dev/mmcblk1 status=progress
```

##### If Image File is Compressed
```bash
gunzip -c /media/amnesia/ad4746be-e769-48ec-959b-504e64705df0/bodhi_backup_2022.img.gz | dd of=/dev/mmcblk1
```

### VIRTUAL BOX steps:

##### Restoring a Drive with DD
```bash
dd if=/media/amnesia/ad4746be-e769-48ec-959b-504e64705df0/bodhi_backup_2022.img of=/dev/sda
```
