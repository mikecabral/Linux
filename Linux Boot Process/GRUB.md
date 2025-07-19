##### Configuring GRUB:
```bash
/boot/grub/grub.conf – red hat, fedora
```
OR
```bash
/boot/grub/menu.lst – suse, debian
```

##### Grub references your hard drive using the following syntax:
```bash
hddrive_number,partition_number
```

**first disk is always hd0**
add a **password** to GRUB, open **menu.ls1** or **grub.conf** and add password password
example: password natasha01

##### Encrypt Password with grub-md5-crypt
##### example
```bash
password –md5 $12WEgfdsgs/3$R#4ds.9393OtO
```

##### Find which grub you’re using
```bash
ls -l /boot/grub
```

#### Configuring GRUB2
**/boot/grub/grub.cfg** file

the files within **/etc/grub.d** directory
the **/etc/default/grub** file

##### Update Grub after making changes
```bash
update-grub
```

##### Create a Config file with GRUB2
```bash
grub2-mkconfig -o /boot/grub2/grub.cfg
```

**GRUB 2 hard drive starts at hd0 like normal, however partitions start at 1.**
