#### **Using DPKG**
```bash
dpkg package_name
```

##### **Command Actions listed below:**

**-i** - **installs** the specified **package**
**-r** - **uninstalls** the specified **package**
**-P** - **uninstalls** the specified **package** and **deletes** its **configuration** **files**
**--configure** – **reconfigures** the specified **package** (can also be done with **dpkg**-**reconfigure**)
**-p** – displays **information** about the specified **package**. (package must **already** be **installed**) 
**-I** – displays **information** about a **package** that **isn’t** currently **installed** on the system**-l** – **lists** all the **installed** **packages** on the system**-L** – **lists** **all** **files** that were **installed** by the **specified** **package** on the system**-S filename** – **identifies** the **package** that **installed** the specified **file**

##### **Options for Associated Actions**

**-B -r** – when you’re **uninstalling** a **package** that **other** **packages** are **dependent** **on**, this option **disables** **those** **packages**
**-G -i** – this option tells dpkg to **not** **install** the specified **package** if a newer version of the **same** **package** is **already** **installed** 
**-E -i** – this option tells dpkg to **not** **install** the specified **package** if the **same** **version** of that package is **already** **installed**
**--ignore -i or -r** – this option causes dpkg to **ignore** **dependency** **information** when **installing** or **removing** a **package**
**--no-act -i or -r** – this option tells dpkg to **check** for **problems**, such as **unresolved** **dependencies**, when installing or removing a package
**--recursive -i** – this option allows you to **install** **multiple** **packages** at once using ***** in the package filename part of the command. All matching packages in the current directory as well as sub directories will be installed.