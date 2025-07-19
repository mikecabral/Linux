mkfs  
mkreiserfs  
xfs and vfat  
mkswap

#### **Using mkfs**
```bash
mkfs or mke2fs
```

#### **Read the manpage**
man mkfs.x (x replacing whatever file system, ext3,ext4,vfat ect)
##### Example
```bash
man mkfs.xfs
```
  
/sbin/mkfs.**minix**
/sbin/mkfs.**ntfs**
/sbin/mkfs.**bfs**
/sbin/mkfs.**ext4**
/sbin/mkfs.**msdos**
/sbin/mkfs.**cramfs**
/sbin/mkfs.**ext3**
/sbin/mkfs.**ext2**
/sbin/mkfs.**vfat**
/sbin/mkfs.**xfs**

##### Easy Way to determine whether your Linux Kernel has xfs Support Enabled ... (as root)
```bash
find / -name mkfs.*.
```

**If it’s been added to your kernel, you should see mkfs.xfs utility installed on the system. /sbin/mkfs**

##### Specifying which File System you want to Use
```bash
mkfs -t ext4 /dev/sdb1
```

**Using mkreiserfs**
```bash
mkreiserfs /dev/sdb1
```
##### Can also use
```bash
mkfs -t reiserfs device
```


#### **Creating xfs and vfat File Systems**
##### First create a standard Linux partition (type 83) using fdisk, then:
```bash
mkfs -t xfs device
```



-----------------------------------------------------------------------
#### THIS VERSION IS PROBABLY DEPRECIATED.. USE NEW VERSION INSTEAD: swapfile.bash

#### **Using mkswap**
##### format partition you just created into a swap partition instead
```bash
mkswap device
```
##### Example
```bash
mkswap /dev/sdb2
````

##### **WARNING** the **type** of **partition** must be set to **82** using fdisk FIRST!

##### Activate All Swap Partitions at once
```bash
swapon -a
```

##### Deactivate all Swap Partitions
```bash
swapoff -a
```
