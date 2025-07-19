#### **Using lsof**
##### **lsof command displays a list of open files**
##Checking for Open Files
```bash
lsof
```

**-s** – displays **file** **sizes**
**-t** – specifies that **lsof** should produce **terse** **output** with process **identifiers** **only** and **no** **header**. This is useful if you are piping the output of lsof to the kill command
**-u user_name** – displays only **open** **files** associated with the **specified** **user**

##### **By default, each filename is followed by a letter indicating the following:**

**c** – **current** directory
**e** – **executable** being **run**
**f** – an **open** **file**
**F** – a **file** that is **open** for **writing**
**r** – the **root** directory
**m** – **memory** mapped file **or** **shared** **library**
**##options you can use with this command include the following:**
**-a** – show all files specified. By default, only files that are accessed by the least one process are shown
**-k** – kill processes accessing the file
**-i** – ask the user for confirmation before killing a process
**-u** – append the **user** **name** of the process owner to **each** **process** **ID** number (PID)