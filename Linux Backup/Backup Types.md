**Full** – **all** specified **files** are **backed** **up**. (**flagged**)
**Incremental** – **only** the **files** that have been **modified** **since** the **last** **backup** are backed up. (**flagged**)**
Differential** – **only** the **files** that have been **modified** **since** the **last** full **backup** are backed up. (**not flagged**)
  
**Partitions / Directories to Back up**
##Backs up only your configuration files, your user data, your log files and your web/ftp files**
/etc /home /opt /root /var /srv

**Using Linux Backup Utilities**

**Create Backups with TAR**  
**##-c** option tells tar to create the new archive. **-v** option is verbose. **-f** option specifies the name of the tar archive to be created.

##### Create Archive File with TAR
```bash
tar -cvf filename directory
```
##### Extract Archived File with TAR
```bash
tar -xvf filename
```
**can use the -z option to unzip the archive before extracting it**

##### Using dd to copy a file
```bash
dd if=input_file of=output_file
```

##### Copy an Entire Partition
```bash
dd if=device_file of=output_file
```

##### Create Image file of an Entire Hard Disk**
```bash
dd if=device_file of=output_file
```

##### Create a Copy of your computer’s MBR Master Boot Record
```bash
dd if=device_file of=output_file bs=512 count=1
```
**this tells dd to grab just the first 512K block of the hard drive**
