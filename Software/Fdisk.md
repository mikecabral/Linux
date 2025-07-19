##### **Using Fdisk**
```bash
fdisk device
```

##### Manage Hard Drive 1
```bash
fdisk /dev/sda
```

##### Display the Partition Table for a Specified Hard Disk
```bash
fdisk device -l
```

**a** – toggle a bootable flag
**b** – edit bsd disklabel
**c** – toggle the dos compatibility flag
**d** – **delete** a **partition**
**g** – create a **new** empty **GPT** **partition** table
**G** – create an IRIX (SGI) partition table
**l** – list known partition types
**m** – print this **menu**
**n** – add a **new** **partition**
**o** – create a new empty DOS partition table
**p** – **print** the partition table
**q** – **quit** without saving changes
**s** – create a **new** empty **Sun** **disklabel**
**t** – **change** a **partition’s** **system id** (if you need to make a SWAP partition) lower case L will list all available
**u** – change **display/entry units**
**v** – **verify** the **partition table**
**w** – **write** **table** to **disk** and **exit**
**x** – **extra** functionality (experts only)