##### **Using Gdisk**
```bash
gdisk device
```

##### Manage Hard Drive 2
```bash
gdisk /dev/sdb
```

**b** – **backup** **GPT** **data** to a file
**c** – **change** a **partition’s** **name**
**d** – **delete** a **partition**
**i** – show detailed **information** on a **partition**
**l** – **list** known **partition** types
**n** – add a **new** **partition**
**o** – create a **new** empty **GUID** **partition** table (GPT)
**p** -  **print** the **partition table**
**q** – **quit** without saving changes
**r** – **recovery** and **transformation** **options** (experts only)
**s** – **sort** partitions
**t** – **change** a **partition’s** **type code** (use this to make SWAP most likely)
**v** – **verify** disk
**w** – **write** **table** to disk and **exit**
**x** – **extra** **functionality** (experts only)
**?** - **print** this **menu  
  
##### Rename a Partition
```bash
name partition name
```

##### Move a Partition to a Different Location on the Disk
```bash
move partition start_point end_point
```

##### Resize a Partition ON the Disk
```bash
resize partition start_point end_point
```

#### Delete a partition
```bash
rm partition
```
