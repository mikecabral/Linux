**Fields** inside the **/etc/fstab** file

1. **specifies** the **device** and **partition** to be **mounted** – example /dev/sda3  
2. the directory (**mount point**) **where** the partition is to be mounted  
3. the **file** **system** **type** of the partition  
4. Various **mount** **options**. You can use the following:

**rw** – **mounts** a file system in **read/write** mode
**ro** – **mounts** a file system in **read-only** mode
**sync** – enables **synchronous** I/O. Changes are **written** **immediately**. Generally used for **removable** **devices**.
**async** – enables **asynchronus** I/O. Chanes are **cached** and **then** **written** when the system isn’t busy. Generally used for **hard** **drives**.
**atime** – specifies that the file **access** **time** is **updated** in the **file’s** **inode**
**noatime** – specifies that a file **access** **time** of files is **not** **updated** in the **file’s** **inode**. This option usually provides better file system performance overall.
**nodev** – **prevents** **interpretation** of **device** **files** in _dev_ _**as**_ _**block**_ _**special**_ _**devices**_
_**dev**_ _–_ _**interprets**_ _**device**_ _**files**_ _in dev_ _**as**_ _**block**_ _**special**_ _**devices**_
_**noexec**_ _–_ _**prevents**_ _**binaries**_ _on the partition from being_ _**executed**_
_**exec**_ _–_ _**allows**_ _**binaries**_ _on the partitions to be_ _**executed**_
_**nosuid**_ _–_ _**blocks**_ _the use of_ _**suid**_ _and_ _**sgid**_ _bits_
_**suid**_ _–_ _**enables**_ _the use of_ _**suid**_ _and_ _**sgid**_ _bits_
_**auto**_ _– the file system is_ _**mounted**_ _**automatically**_ _on_ _**boot**_
_**noauto**_ _– the file system is_ _**not**_ _**mounted**_ _**automatically**_ _on boot_
_**user**_ _–_ _**allows**_ _**users**_ _to_ _**mount**_ _the file system_
_**nouser**_ _–_ _**only**_ _**root**_ _can_ _**mount**_ _the file system_
_**defaults**_ _– implements the default options of_ _**rw, suid, dev, exec, auto, nouser and async**_
_5. specifies whether the file system should be dumped:_ _**0**_ _means_ _**don’t**_ _**dump**__, whereas_ _**1**_ _means_ _**dump**_
_6. specifies the_ _**order**_ _in which_ _**fsck**_ _should check the file system at reboot. The root partition should be set to a value of_ _**1**__. Other partitions should have a value of_ _**2**__._