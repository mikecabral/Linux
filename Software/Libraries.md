#### **Shared Libraries**

**Dynamic** – exist as **files** **in** the **linux** **system**. Programmers simply insert links to the functions in these shared libraries.  

**Static** – linked **statically** **into** the **program** when it’s compiled**  
  
##### **/lib/** and **/usr/lib/** directories always **assumed** to **contain** **shared** **libraries**, so they **aren’t** **listed** in the /**etc/ld.so.conf** file.**  
  
##### View a List of All Shared Libraries available on your Linux system
```bash
ldconfig -p
```
(if you’re not root, you must specifiy the full path to ldconfig **/sbin/ldconfig**)  
```bash
sudo /sbin/ldconfig -p
```

##### Check Shared Library Dependencies
```bash
ldd -v /sbin/ip
```
