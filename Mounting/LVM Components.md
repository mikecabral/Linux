**Physical volumes** – can be **either** a **partition** or an **entire** **disk**

**Volume groups** – consists of one or more **physical** **volumes** **grouped** **together**. You can add hard disks or partitions to the volume group whenever you need more storage space

**Logical volumes** – these are **defined** **from** a **volume** **group**. Logical volumes can be formatted with a Linux file system and mounted just like physical partitions

##### **WARNING** if you want to use an **entire** **hard** **disk** as an **LVM** physical volume, it **cannot** **contain** a **partition** **table**

**If a disk you want to use already has an existing partition table, you can use the dd command to obliterate it.**

```bash
dd if=/dev/zero of=/dev/sdc bs=512 count=1
```

##### Define Disks/Partitions you want to use
```bash
pvcreate device
```

##### Creating LVM Volume Groups
```bash
vgcreate volume_group_name physical_volume1 physical_volume2
```
##### Example
```bash
vgecreate DATA /dev/sdb1 /dev/sdb2 /dev/sdc
```

##### View All Physical Volumes on the system
```bash
pvscan -v
```


#### **Managing Volume Group commands**

**vgexpand** – to **add** additional **physical** **volumes** to an existing volume group
**vgreduce** – to **remove** a **physical** **volume** from an exisiting volume group. BEFORE running vgreduce, you must use pvmove to shift the data in the physical volume to be removed to another physical volume on the system
**vgremove** – to **delete** a **volume** **group**. Before you can use vgremove, you must first remove all logical volumes that have been defined in the volume group

##Creating LVM Logical Volumes
```bash
lvcreate -L volume_size -n volume_name volume_group_name
```

#### **Managing Logical Volume commands**

lvextend** – to **increase** the **size** of a **logical** **volume**. You must first add additional physical volumes (disks or partitions) to the volume group to do this
**lvreduce** – to **reduce** the **size** of a **logical** **volume**
**lvremove** – to **remove** a **logical** **volume** from the system

##### Once Logical Volumes have been Created... Create File Systems on them and mount them
```bash
Mkfs -t file_system /dev/volume_group/logical_volume
```

##### You can mount a logical volume using the mount command
```bash
mount -t file_system /dev/volume_group/logical_volume /mount_point
```

### Checking Partition and File Usage
##### df or df filename

##### Display Statistics in Human Readable Form
```bash
df -h
```

##### Display the Type of File
```bash
df -hT
```

##### List inode Usage information instead of disk space usage
```bash
df -i
```

##### Another Disk Space usage utility du
```bash
du directory
```

**-c** – used to calculate a grand total
**-h** used to display output in human-readable form
**--exclude** filename_or_pattern – used to exclude all files that match the specified filename or pattern

##### Checking the File System Integrity
```bash
fsck device
```
##### Example
```bash
fsck /dev/sdb1
```

##### Restore a Superblock that’s been Corrupted
```bash
e2fsck -f -b backup_superblock
```
