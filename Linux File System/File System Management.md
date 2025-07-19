#### **The Role of the Linux File System**

data can be **saved** in a **persistent** **manner**
data is **organized** and can be **easily** **located**
data can be **quickly** **retrieved** for use at a later point in time, and  
data **integrity** is **preserved**

#### Common Linux File Systems

**ext2** - The **maximum** **file** **size** supported in the ext2 file system is **2TB (terabytes)**. An ext2 volume can be up to 4TB. File names can be up to 255 characters long. The ext2 file system supports Linux file system users, groups, and permissions (called POSIX permissions). It also supports file compression. To **clean** **up** the **file** **system**, the ext2 file system will automatically run a program called **e2fsck** the next time the system is booted.
 
**ext3** - stands for “Third Extended File System.” The two are so similar that most of the file system utilities used by ext2 are also used by ext3. You can easily upgrade ext2 file systems to ext3. You can even downgrade an ext3 file system to ext2. However, the ext3 file system offers one key advantage that makes it highly preferable over ext2: _**journaling**_. Remember that the key disadvantage of ext2 is the fact that it must check the entire file system if the system goes down uncleanly. Journaling eliminates this problem. 
**Reiser** - The Reiser file system is an **alternative** to the **ext3** **file** **system**. Like ext3, Reiser **utilizes** **journaling** to make crash recovery very fast. However, Reiser is a completely different file system from ext2 and ext3, using a **dramatically** **different** **internal** **structure**. This allows the Reiser file system to support a larger **maximum** **file** **size** of **8TB** and **maximum** **volume** **size** of **16TB**. In addition, the structure of Reiser allows it to perform much faster than ext2 or ext3. 

**ext4** – The ext4 file system was released in late 2008. As you might guess, ext4 (Fourth Extended File System) is an updated version of ext3. Just as ext3 is backward compatible with ext2, ext4 is backward compatible with ext3 (and ext2, for that matter). The ext4 file system **supports** **volumes** **up to 1 exabyte** in size and **files** **up to 16 terabytes** in size. You can have a **maximum of four billion files** in an ext4 file system. As with ext2 and ext3, the maximum length of a file or directory name is 255 characters. Ext4 also uses checksums to verify the journal file itself. This helps improve the overall reliability of the system because the journal file is one of the most heavily used files of the disk. As you can see, ext4 represents a dramatic leap forward over ext3 and Reiser.

**btrfs** - The btrfs (pronounced “butter-fs”) file system is a newer Linux file system that represents an evolutionary leap in the way file systems organize and protect data. Btrfs is a type of **“copy-on-write” file system** that is very similar to the NSS file system found in Novell products as well as the Storage Space technology found in the latest versions of Windows.

**BTRFS Storage Pools** - an **alternative** to the traditional process of creating **disk** **partitions**. Instead, you **create** **storage** **pools** from storage devices in your system. From the storage pool, you can **allocate** **space** to **specific** **storage** **volumes**. **Instead** of **mounting** **partitions**, you **mount** **storage** **volumes** at **mount** **points** in your file system. This provides you with a great deal of flexibility when allocating space on the system. For example, suppose you are out of space on the /home volume. To **add** **capacity**, all you have to do is install a new hard drive in the system and then allocate its space to the pool where the /home volume lives. When you do, the size of the volume is automatically increased. You didn’t have to back up the data and restore it as you would with traditional partitions.

**BTRFS Snapshots** - The snapshot functionality provided by btrfs **protects** **your** **data**. Essentially, it can be configured to **take** **snapshots** of **your** **data** at **specified** **intervals** and **save** it on **separate** **media**. If a file ever gets lost or corrupted, you can grab a previous version of the file from a saved snapshot and **restore** **it in** a matter of **seconds**.


#### **Other File System Management Utilities**

**tune2fs** – this utility is used to **adjust** various file **system** **parameters** on **ext2/3/4** file systems  
options you can use:
**-c n** – sets the **number** of **mounts** (n) after which the file system will automatically be checked by fsck
**-i interval d|m|w** – sets the **maximum** **time** between file **system** **checks** in **d** (days), **m** (months), or **w** (weeks)
**-j** – **adds** a **journal** to an **ext2** file system
**-L volume_label** – sets the volume label of the file system
**reiserfstune** – this is the Reiser equivalent of the tune2fs utility
**dumpe2fs** – displays lots of useful **information** about **ext2/3/4** file system. Use the **-h option** to make the output more **readable**.
**debugfs** – the debugfs program is an interactive **file** **system** **debugger**. It can be used to **examine** or even **change** the **state** of an **ext2/3/4** file system. The syntax is **debugfs device**.
**##by default the file system is opened in read-only mode. Include the -w option to open it in read-write mode.**

#### **Commands you can enter at the debugfs prompt:**

**show_super_stats** – displays **information** **equivalent** to that displayed by **dupe2fs**

##### **Very useful for salvaging important file from a mangled file system:**
**write in_file out_file** – allows you to **copy** a **file** from the **file** **system** to **another** **file** **system**
```bash
write in_file out_file
```

**stat file_or_directory name** – displays **extended** **information** about the **file** or **directory** specified
**list_deleted_inodes** – displays a **list** of **deleted** **inodes** in the file system

**xfs_admin** – the xfs **equivalent** of **tune2fs**. This utility actually uses the **xfs_db** executable to **modify** various **parameters** of an **xfs file system**. The file system **must** be **unmounted** before you can **make** any **changes**. ##**Options you can use with this utility include the following:**
**-j** – enables **version 2 log format**, which is a **journal** format supporting **larger** log **buffers**
**-l** – displays the **file** **system’s** **label**
**-u** – displays the file system’s **universally unique identifier** (UUID)
**-L label** – **sets** the file system’s **label**
**-U uuid** – **sets** the **UUID** of the **file** **system**

**xfs_info** – displays useful **information** about **xfs file systems**
**xfs_metadump** – **dump** xfs file system **metadata** (such as filenames and file sizes) to a file

#### **Copying, Moving, and Deleting Directories**

In addition to creating and viewing directories in the Linux file system, you can also copy, move, or delete them using shell commands. You use the following utilities to accomplish these tasks:  
**cp** This utility is used to copy entire directory structures from one location in the file system to another.

```bash
cp
```

To copy an entire directory structure, you need to include the –R option, which specifies that the directory contents be recursively copied. In the example that follows, the cp –R ~/MyFiles ~/backup command was issued in the rtracy user’s home directory. This caused the MyFiles directory and all of its files and subdirectories to be copied to the backup directory in the user’s home directory. Because cp _copies_ the directory, the original directory is left intact.

```bash
cp -R ~/MyFiles ~/backup
```

**mv** The mv command is used much like cp. However, it copies the specified directory to the new location in the file system and then _deletes_ the original. For example, to move a directory named backup from my home directory to /tmp, I would enter mv ~/backup /tmp. The mv command can also be used to rename directories. Simply enter mv followed by the directory to be renamed and then the new directory name. For example, to rename the backup directory in the home directory to temp, you would enter mv ~/backup ~/temp.

```bash
mv ~/backup ~/temp
```

**rmdir** This utility can be used to delete an existing directory. To use it, simply enter rmdir _directory_name_—for example, rmdir MyFiles. Be aware, however, that rmdir requires that the directory be empty before it will delete it. On many distributions, an alias named rd is defined by one of your shell configuration files that _runs_ the rmdir command.

```bash
rmdir directory_name
```

**rm** The rm utility is a more powerful deletion utility that can be used to delete a populated directory. To delete a directory, enter rm –r _directory_name_.

```bash
rm -r directory_name
```

If you get the Argument is too long error, use xargs instead to send commands in 128KB chunks. Example: find ~/ -name "*~" | xargs rm (removes anything that starts with ~ inside HomeDir)

```bash
~/ -name "~" | xargs rm
```

