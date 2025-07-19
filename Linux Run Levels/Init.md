#### **Set Run Levels with Init**
**init command init 0, init 1, init 2 ect**

0 – **halts** the system  
1 – Runs Linux in **single**-**user** mode. **CLI** is used  
2 – Runs Linux in **multiuser** **mode** with **networking** **disabled**. **CLI** is used  
3 – Runs Linux in **multiuser** **mode** with **networking** **enabled**. **CLI** is used  
4 – **Undefined** by default. You can actually edit the /etc/inittab file and define your own custom runlevel  
5 – Runs Linux in **multiuser** **mode** with **networking** **enabled**. The **graphical** **user** **interface** is used.  
6 – **Reboots** the system.

**Init Commands**
```bash
/etc/init.d/script_name start | stop | restart
```

##### Start Service
```bash
/etc/init.d/script_name start
```
##### Stop Service
```bash
/etc/init.d/script_name stop
```

##### Restart Service. Stops then starts associated service. Use when you’ve made extensive config changes to the service.
```bash
/etc/init.d/script_name restart
```

##### Reload Service. Use this parameter to reread the service’s config file without restarting the service iteself. (not all daemons support this)
```bash
/etc/init.d/script_name reload
```

##### on some distros you don’t need to specify the full path
```bash
rcscript_name start | stop | restart
```
##### Example
```bash
rcsmb stop
```


#### **Important files in the /etc/init.d**

**rc** – **BSD** and **System V** – script used to **switch** **between** **runlevels** while the **system** is **running**
**halt** – **BSD** – script can **stop** or **reboot** your **system**. It is run if the current run level is changed to 0 or 6
**boot** – **BSD** – script is run by **init** when the **system** **first** **starts**. It **runs** the **scripts** **contained** in **/etc/init.d/boot.d**. Loading **kernel** **modules**, **verifying** the **file** **systems** and setting **system** **clock**
**boot.local** – **BSD** – script run by **init** at **startup**. Contains **additional** **startup** **commands**. (if you want to run a particular command automatically at startup, you can insert the command into this file with a text editor)
**rc.sysinit** – **System V** – script’s function is similar to the boot script on a BSD-type system. It’s used to **set** **the** **path**, **check** the **file** **system** for **errors**, set the **system** **clock** and so on.
**Insserv Utility**

##### Enables the daemon specified at the run levels listed in the Default-Start directive of the INIT INFO block of the service’s init script
```bash
insserv service_name
```

##### Disable the Service (removing all links for the service in the various rcx.d directories) and 
stops the service if it’s currently running
```bash
insserv -r service_name
```

##### Change the Default Runlevel of a RUNNING service
```nasj
insserv -d service_name
```

##### Create new Customized Start and Kill Script links
```bash
insserv service_name,start=comma-separated_list_of_runlevels insserv ntp,start=3,5
```

##### List the status of ALL daemons installed on your system
```bash
chkconfig -l daemon_name
```
##### Example
```bash
chkconfig -l ntp
```

##### Change Default Run Levels
```bash
chkconfig -s ntp 35
```

##### Check to see your Changes
```bash
chkconfig -l ntp
```

The syntax for using shutdown is **shutdown +**_m_ **–h|–r** _message_**.** The +_m_ option specifies the amount of time (in minutes) before shutting down the system. You can also use the **now** option instead of +_m_ to specify that the system go down immediately. If you need the system to go down at a specific time, you can replace +_m_ with the time (entered as _hh_**:**_mm_) when the shutdown should occur. The –h option specifies that the system be halted, whereas the –r option specifies that the system be rebooted. Some examples of using shutdown are shown here:

##### Shutdown with Message
```bash
shutdown +10 –h Please save your work and log out.
```
