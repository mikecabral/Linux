## How to clone an entire hard disk

The syntax is as follow to make disk image with dd:  
`dd if=/dev/input/DEVICE-HERE of=/dev/OUTPUT/DEVICE-HERE bs=64K conv=noerror,sync`  
To clone /dev/sdc (250G) to /dev/sdd (250G) in Linux, enter:  

`dd if=/dev/sdc of=/dev/sdd bs=64K conv=noerror,sync`  
In this example, I am going to clone /dev/ada0 (250G) to /dev/adb0 (250G) in FreeBSD and make an image using dd. For example:  

`dd if=/dev/ada0 of=/dev/adb0 bs=64K conv=noerror,sync`  
Where,

1. **if=/dev/file** : Input device/file.
2. **of=/dev/file** : Output device/file.
3. **bs=64k** : Sets the block size to 64k. You can use 128k or any other value.
4. **conv=noerror** : Tell dd to continue operation, ignoring all read errors.
5. **sync** : Add input blocks with zeroes if there were any read errors, so data offsets stay in sync.

## How to clone a partition and make disk image with dd

To clone /dev/sdc1 to /dev/sdd1 with dd and create an image, enter:  

`dd if=/dev/sdc1 of=/dev/sdd1 bs=128K conv=noerror,sync`  
Sample outputs:

15874+0 records in
15873+0 records out
1040252928 bytes transferred in 3.805977 secs (273320858 bytes/sec)

## Making disk image with dd using live CD/DVD or USB pen drive

You can boot from a live cd or USB pen drive. Once booted, make sure no partitions are mounted from the source hard drive disk. You can store disk image on an external USB disk. The syntax is as follows  
`dd if=/dev/INPUT/DEVICE-NAME-HERE conv=sync,noerror bs=64K | gzip -c > /path/to/my-disk.image.gz`  
In this example, create disk image for /dev/da0 i.e. cloning /dev/da0 and save in the current directory:  

`dd if=/dev/da0 conv=sync,noerror bs=128K | gzip -c > centos-core-7.gz`

## How to restore system (dd image)

The syntax is:  

`gunzip -c IMAGE.HERE-GZ | dd of=/dev/OUTPUT/DEVICE-HERE`  
For example:  

`gunzip -c centos-core-7.gz | dd of=/dev/da0`

### Tip #1: Not enough disk space locally? Use the remote box

You can send the image through ssh and save it on the remove box called server1.cyberciti.biz:  

`dd if=/dev/da0 conv=sync,noerror bs=128K | gzip -c | ssh vivek@server1.cyberciti.biz 'dd of=centos-core-7.gz'`  
You can see [status with dd command](https://www.cyberciti.biz/faq/linux-unix-dd-command-show-progress-while-coping/ "Linux dd Command Show Progress Copy Bar With Status") as follows:  

`dd if=/dev/da0 conv=sync,noerror bs=128K status=progress | gzip -c | ssh vivek@server1.cyberciti.biz 'dd of=centos-core-7.gz'`  
It will show status as follows for 10GiB disk:

10674372608 bytes (11 GB, 9.9 GiB) copied, 104 s, 103 MB/s 
81920+0 records in
81920+0 records out
10737418240 bytes (11 GB, 10 GiB) copied, 104.726 s, 103 MB/s
25671+1 records in
25671+1 records out
13143559 bytes (13 MB, 13 MiB) copied, 104.453 s, 126 kB/s

Where,

1. dd if=/dev/da0 conv=sync,noerror bs=128K status=progress : Make /dev/da0 disk image and pass that output to the gzip command.
2. gzip -c : Compress data received via pipes and write output on standard output (stdout) while keeping original files unchanged. Finally, pass that data to the ssh command.
3. ssh vivek@server1.cyberciti.biz 'dd of=centos-core-7.gz' : Log into the given server and run the dd command to make a new disk image named centos-core-7.gz from compressed data sent by the gzip command.

### Here is how to restore image from local system:

The syntax is:  

`ssh vivek@server1.cyberciti.biz 'dd if=disk.img' | dd of=/dev/sdb   ## OR ##   ``ssh vivek@server1.cyberciti.biz 'dd if=centos-core-7.gz' | gunzip -c | dd of=/dev/sdb   ## add status=progress if needed ##   `

`ssh vivek@server1.cyberciti.biz 'dd if=centos-core-7.gz status=progress' | gunzip -c | dd of=/dev/sdb`  
Here is what I will see:

13120000 bytes (13 MB, 13 MiB) copied, 322 s, 40.8 kB/s 
25671+1 records in
25671+1 records out
13143559 bytes (13 MB, 13 MiB) copied, 321.542 s, 40.9 kB/s
20971520+0 records in
20971520+0 records out
10737418240 bytes (11 GB, 10 GiB) copied, 408.628 s, 26.3 MB/s

Where,

1. ssh vivek@server1.cyberciti.biz 'dd if=centos-core-7.gz status=progress' : SSH into the given server and run the dd command to read the disk image. Send data to the gunzip command using shell pipes.
2. gunzip -c : Uncompress data and write to stdout. Send the data to the dd command on the local machine.
3. dd of=/dev/sdb : Write data received from “ssh ... | gunzip” pipe to /dev/sdb disk.

### Tip #2: See progress while making an image with dd

You need to [use GNU/BSD dd with coreutils version 8.24 as follows](https://www.cyberciti.biz/faq/linux-unix-dd-command-show-progress-while-coping/ "Linux dd Command Show Progress Copy Bar With Status") (pass the status=progress to the dd):  

`dd if=/dev/sdc1 of=/dev/sdd1 bs=128K conv=noerror,sync status=progress`