### Managing Linux Network Settings
  
#### The OSI Reference Model

**Application Layer** - Responsible for **providing** **applications** with a **way** to **access** the **network**

**Presentation Layer** - Responsible for ensuring that information passing through the OSI layers is **formatted** **correctly** for the application on the destination system

**Session Layer** - Responsible for **establishing** and **maintaining** **connections** between **source** and **destination** network **hosts**. These connections are called _**sessions**_

**Transport Layer** - On the sending host, the Transport layer **receives** **information** from the **upper** **layers** of the OSI model and **divides** it into **small**, **transmittable** **chunks** called _**packets**_. On the receiving host, the Transport layer reassembles packets from datagrams received from lower layers of the OSI model. The Transport layer provides error-checking mechanisms to ensure that data arrives at the destination host intact. The Transmission Control Protocol (TCP) and User Datagram Protocol (UDP) operate at this layer.

**Network Layer** - Enables the **routing** of the **data**. It specifies how to recognize the address of neighboring nodes and routers. It also specifies how to **determine** the **next** **network** **point** to which a **packet** should be **forwarded** toward its destination. The **Internet Protocol** **(IP)** operates at **this** **layer**, as does the **Internet Control Message Protocol (ICMP)**

**Data Link Layer** - Defines the **rules** and **procedures** for **accessing** the **physical** **layer**. It defines how hosts are identified on the network and how the network medium is accessed. It also specifies how to verify that the data received from the physical layer doesn’t have any errors. Information received from upper layers is organized into _**datagrams**

**Physical Layer** - Transmits **electrical** **signals** between **hosts**

**Well-known ports** - Reserved for specific services, well-known ports are those numbered from 0 to 1023. Here are some examples:

Ports 20 and 21: **FTP**
Port 22: **Secure Shell (SSH)**
Port 23: **Telnet**
Port 25: **SMTP**
Port 53: **DNS**
Port 80: **HTTP**
Port 110: **POP3**
Port 119: **NNTP (news)**
Port 123: **NTP (time synchronization)**
Ports 137, 138, 139: NetBIOS**
Port 143: **IMAP**
Port 161: **SNMP**
Port 162: **SNMP Traps**
Port 389: **LDAP
Port 443: **HTTPS**
Port 465: **SMTP using TLS/SSL (SMTPS)**
Port 514: **Syslog remote logging**
Port 636: **Secure LDAP**
Port 993: **IMAP using TLS/SSL (IMAPS)**
Port 995: **POP3 using TLS/SSL (POP3S)**

**Registered ports** - **ICANN** has **reserved** **ports** **1024** through **49151** for special implementations. Organizations can create their own network service and then apply for a registered port number to be assigned to it.

**Dynamic ports** - Dynamic ports are also called _**private**_ _**ports**_. Ports **49152** through **65535** are designated as dynamic ports. They are available for use by any network service. They are frequently used by network services that need to establish a **temporary** **connection**. For example, the service may negotiate a dynamic port with the client. It will then use that port during the session. When the session is complete, the port is closed.

##### View Network Info
```bash
ifconfig  
```

##### Configure Network Interface with IP address Parameters
```bash
ifconfig interface ip_address netmask subnet_mask broadcast broadcast_address  
```

##### Assign ens32 interface an ip of 192.168.1.1, subnet mask of 255.255.255.0 and broadcast address of 192.168.1.255
```bash
ifconfig ens32 192.168.1.1 netmask 255.255.255.0 broadcast 192.168.1.255
```

##### if you reboot changes will be lost
**to make changes persistent** edit the **/etc/sysconfig/network** direcotry.
```bash
ifcfg-ens32
```

On **some** **distros** the **file** **name** will be the **MAC** **address** of the NIC.
```bash
ifcfg-eth-id-00:0c:29:d1:52:d4
```

### Persistent Parameters:

**BOOTPROTO=”static”** - this option specifies that the interface uses a static ip - **set** to **dhcp** **automatically**
**STARTMODE=”auto”** – this option specifies that the interface be brought online when the system is booted – **set** to manual to **manually** **start** the interface. Some distros use onboot instead of auto**IPADDR=”192.168.1.81/24”** – assigns an **ip** address of **192.168.1.10** to the interface with a **subnet** mask of **255.255.255.0**
**NETMASK=”subnet_mask”** = if the prefix isn’t assigned using CIDR notation in the IPADDR parameter, you can use NETMASK= to assign a subnet mask to the interface.
**BROADCAST=”192.168.1.255”** – specifies the **broadcast** **address** of the segment the interface is connected to**REMOTE_IPADD=** - speicifies the **IP** address of the **remote** **node** in a peer-to-peer type of connection**MTU**= - specifies the **size** of the **Maximum** **Transmission** **Unit** (which is **1500** by default on an Ethernet network) – if your network uses **jumbo frames**, you can set this parameter to **9000**.
**LABEL_0=’0’** – these parameters are used to **assign** an **IPv6** address to the **eth0** interface**IPADDR_0=’2607:f0d0:1002:0011:0000:0000:0000:0003 PREFIXLEN_0=’64’**

##### Restart Network Interface
```bash
ifdown interface followed by ifup interface
```

##### Specify the Interface gets it’s ip from a DHCP Server
```bash
dhclient ens32
```

##### Show Network Interfaces with ip addr
```bash
ip addr show
```

##### Configure Parameters**
```bash
ip addr add ip_address dev interface
```
##### Example
```bash
ip addr add 10.0.0.84 dev ens32
```

##### Remove an IP Address from an Interface
```bash
ip addr del ip_address dev interface
```

##### Disable Network Interface**
```bash
ip link set interface down
```

##### Enable Network Interface
```bash
ip link set interface up
```

### Configuring IPv6
  
**Stateful DHCPv6** - Configures the DHCP server to provide each IPv6 DHCP client with an IP address, the default gateway address, and the DNS server IP address. The DHCP server tracks the status of each IPv6 DHCP client, hence the name _stateful_

**Stateless DHCPv6** - Does **not** **assign** IPv6 addressees to IPv6 clients, nor does not track their status. In this configuration, the DHCPv6 server simply assigns the DNS server IP address to network hosts. Obviously, stateless DHCPv6 does not provide a complete addressing solution. Instead, it must be used in conjunction with other IPv6 address assignment schemes, such as SLAAC

### Using ping

##### Ping target 10 times
```bash
ping -c 10 192.168.2.1
```

### Using netstat

#### IPv6 uses ping6
```bash
netstat
```

**-a** – lists **all** listening and nonlistening **sockets**
**-i** – displays statistics for your network **interfaces**
**-l** – lists **listening** sockets**-s** – displays **summary** **information** for each protocol**-r** – displays your **routing** **table**

### Using traceroute

```bash
traceroute destination_hostname_or_ip_address
```

### traceroute6 for IPv6

### Using nc (netcat)
**Establishes a TCP or UDP connection between two network hosts**

##### must open a TCP listening socket on one of the hosts being tested:
```bash
nc -l 2388
```
The **-l option** tells netcat to **listen** for **incoming** **connections**. TCP is used by default. -u for UDP

##### connect to the listening socket from another system and establish a TCP or UDP connection

```bash
nc 10.0.0.83 2388
```

**You can type on one screen and see it appear on the other if it worked**
**Firewalls must be adjusted on both system for this to work**
  
### Using Name Resolution Tools

### dig (Domain Information Groper)

##### performs DNS lookup on your DNS server and displays detailed information about the hostname and the DNS server itself dig @dns_server hostname
```bash
dig www.google.com
```

#### gettent

```bash
gettent
```

##### getent hosts hostname/router
```bash
getent hosts www.nebo-tech.com
```

##### Query Any Data configured in your /etc/nsswitch.conf file
```bash
cat /etc/nsswitch.conf
```

OR (Same Command)

##### Pull Entries out of your passwd file
```bash
getent passwd
```

##### Displays IP4 and IPV6 Address
```bash
host www.google.com
```

### Managing Network Services  
  
**CUPS – Common UNIX Printing System**
I**nternet Printing Protocol (IPP)** on port **631**
if printer isn’t PostScript compatible, you use CUPS filters to convert print jobs from PostScript into the appropriate format using the **PDL** of the printer to which they are being sent. These filters are located in **/usr/lib/cups/filter**
CUPS backends are responsible for providing the interface between the scheduler and the actual printer hardware  
the CUPS backends are located in **/usr/lib/cups/filter**
**CUPS PostScript Printer Description** are used by cupsd to determine the capabilities of your printer
**PPD** files are stored in **/etc/cups/ppd**  
**Open CUPS web-based admin utility**  
http://your_server_address:631
Print queue and filter information from the print job are saved in **/var/spool/cups**  
The **CUPS** service is started and stopped using the **/usr/lib/systemd/system/cups.service** file  
  
### Configuring the CUPS Service

**/etc/cups/cupsd.conf** is the **main** **configuration** file there are several **more** **files** within the **/etc/cups directory**
**CUPS** is configured to use the **/etc/cups/passwd.md5** file to **store** user **accounts**  
**##create an administrative user in the passwd.md5 file named root that is a member of the CUPS admin** group named **sys**

```bash
lppasswd -g sys -a root
```

### Configuring a CUPS Printer
All **CUPS printers** are defined in the **/etc/cups/printers.conf** file  

Use the web-based admin utility instead. http://localhost:631

##### Send Print Jobs from the CLI (Command Line) to the Printer
```bash
lp -d printer_name filename
```
##### Example
```bash
lp -d HPLJ5 ./myfiles
```

**–n _x**_ - Prints _x_ number of copies
**–m** - E-mails a confirmation message to my local user account when the job is finished printing
**-q _x**_ - Sets the priority of the print job to _x
**–o landscape** - Prints the file landscape instead of portrait
**–o sides=2** - Prints the file double-sided on a printer that supports duplexing
  
### Using CLI Tools to Manage CUPS
**View CUPS Printer Information lpstat Utility**

##### Display All Information about All CUPS Printers on the System
```bash
lpstat -t
```

##### Cancel a Print Job
```bash
cancel job_ID
```

##### Specify a Default Printer
```bash
lpoptions -d printer
```
##### Example
```bash
ldoptions -d HPLJ5
```

##### View Printer’s Configuration Settings**
```bash
lpoptions -l
```

##### Enable or Disable Printer’s Print Queue**
```bash
cupsaccept printer_name or cupsreject printer_name
```

**--hold** option – stops printing after the current job is complete

##### Disable the Printer Itself, NOT the Queue
```bash
cupsdisable printer_name
```

### Using the Line Printer Daemon (lpd) (OLD STYLE)
#### these commands will also work with CUPS:

##### Print a Document
```bash
lpr -P printer_name filename
```

##### view printer status
```bash
lpc status
```

##### View Pending Print Jobs
```bash
lpq
```

##### Delete Pending Print Job from Queue
```bash
lprm job_number
```

### Setting the Hardware Clock with hwclock

**-r** or **–show** – reads the **current** **time** from the **hardware** **clock** and displays it on the screen **--set –date=date_string** – sets the hardware clock to the time specified. Hwclock –set –date =”9/16/11 08:00:00” will set the date to September 16th 2001, and the time to 8:00am**--s** or **–hctosys** – sets the **system** **time** to the **current** time of the **hardware** **clock**
**--w** or **–systohc** – sets the **hardware** **clock** to the **current** **system** **time**
**--utc** or **–localtime** – specifies that the **hardware** **clock** time is configured to use either **UTC** or **local time**
  
##### Synchronize Time on the Local System with the time on a Time Server over the Network
```bash
netdate time_server
```

##### After Syncing the Time with Netdate, you may want to sync System Time with your Hardware Clock
```bash
hwclock –systohc command
```
  
### Synchronizing Time with NTP (Network Time Protocol)
##### **NTP** operates on **port** **123**

**Stratum -** NTP uses the concept of _**stratum**_ to define a **hierarchy** of NTP servers:**Stratum 1** - Stratum 1 time servers get their time from a **reference time source**, such as the Naval atomic clock. (See tycho.usno.navy.mil for more information.)  
**Stratum 2** **-** Time servers that get their time from **stratum 1** servers.**Stratum 3** **-** Time servers that get their time from **stratum 2** servers.**Stratum** _n_ - NTP servers can continue to a depth of **256 strata**.

Although they are available on the Internet, you probably won’t be allowed access to a Stratum 1 server. However, many Stratum 2 servers are publicly available. To reduce the load on these public time sources, you should configure a very limited number of systems on your internal network to sync time with the public time provider. In fact, many organizations configure only a single Stratum 3 server on their network that gets its time from a public Stratum 2 server on the Internet. They then configure all their internal hosts to get their time from that server. On a larger network, you may need to configure several Stratum 4 servers and configure them to get time from your Stratum 3 server and then configure the rest of your network hosts to get time from the Stratum 4 servers.

**Stepping and slewing** - The NTP protocol initially **syncs time** between the time consumer and the time provider about **once per minute**. However, the interval **increases gradually** to **once every 17 minutes** once time is closely synced between the provider and consumer. Essentially, large adjustments occur relatively quickly, but then only small adjustments are made across a longer time interval.

If the **time difference** between the **provider** and the **consumer** is **small** (less than 128 milliseconds), **NTP adjusts** the **time** on the consumer **gradually**. This is called _**slewing**_. If, on the other hand, the **time difference** between provider and consumer is **relatively large**, the time **adjustments** are **made** more **quickly** on the consumer. This is called _**stepping**_.

**Insane time** - If the time difference between the provider and consumer is **more than 17 minutes off**, the **NTP daemon** (ntpd) **considers time** to be “insane” and **will not adjust** it.**Drift** - NTP measures and corrects for **incidental clock frequency errors** (called _**drift)**_. It **writes** the current frequency **value** to the **ntp.drift** file in the **/var/lib/ntp/drift/** directory.

If you stop and then restart the NTP daemon, it initializes the clock frequency using the value in this file. This prevents ntpd from having to relearn the frequency error associated with the system clock on your system.**Jitter** - Jitter is the estimated time difference between the consumer and the provider since the last time poll.

### Configuring NTP

##### Install NTP
```bash
rpm -q ntp
```

Edit the **/etc/ntp.conf** file in a text editor

##### Add Entires to the File for Network Time Providers you want your system to Sync Time with
```bash
server time_server_ip_address_or_DNS_name
```

##### public NTP time provider on the internet

http://support.ntp.org/bin/view/Servers/WebHome

```bash
server pool.ntp.org
```

##### **Save changes, Close file. Do a one-time synchronization check with your NTP time provider. The issue here is insane time. If your system is already more than 17 minutes off from the time on the NTP time provider, you must get the two systems within this time window before NTP will work**

##### One-Time Synchronization Check
```bash
ntpdate address_of_time_provider
```
**you may need to run this command several times to get time close before starting the daemon. The daemon must be stopped before you run ntpdate command!**

##### Newer Versions of NTP on Newer Linux Distros
```bash
/etc/init.d/ntp ntptimeset or rcntp ntptimeset
```
##### Start the Daemon afterward
```bash
rcntp start
```

##### Configure ntpd aemon to Start everytime the System Boots
```bash
insserv ntp
```
OR
```bash
systemctl start ntp
```

**ntpq -p** – this command **queries** the **status** of the ntpd daemon.**remote** – specifies the **hostname** or **ip address** of the **time** **provider**
**refid** – specifies the type of the **reference** **source**
**st** – specifies the **stratum** of the **time** **provider**
**when** – specifies the number of seconds **since** the **last** **time** **poll**
**poll** – specifies the number of seconds **between** **two** **time** **polls**
**reach** – displays **whether** **or** **not** the **time** **server** was **reached** in the **last** **poll**. Each successful poll **increments** this field by 1**delay** – specifies the **time** **(in milliseconds)** that it took for the **time** **provider** to **respond** to the request**offset** – specifies the **time difference** between the **local** **system** clock and the **time** **provider** **(in milliseconds)**
**jitter** – specifies the **size** of **time** **discrepancies** **(in milliseconds)**
**ntptrace** – the ntptrace utility **traces** **how** the **time** **consumer** is **receiving** the **time** **from** the **provider**. It lists the time **provider’s name**, its **stratum**, and its **time offset** from the system clock on the local system

### Managing an MTA  
**read messages for local users from the local MTA directly from CLI mail**

### Securing Linux

##### **Tips to secure server/workstations:**

lock door server room and use lock session, wallpaper password

##### Using nohup, running a program in the background and logging out
```bash
nohup command &
```

### Aliases
**aliases** are located in **/etc/sudoers**

**User_Alias** - Specifies the users who are allowed to run commands
**Cmnd_Alias** - Specifies the commands that users are allowed to run
**Host_Alias** - Specifies the hosts users are allowed to run the commands on
**Runas_Alias** - Specifies the usernames that commands may be run as

### IP TABLES Commands

##### List Existing Rules
```bash
iptables -L
```

##### Deletes the First Rules in the FORWARD chain
```bash
iptables -D FORWARD I
```

##### Deletes All Rules from the Filter Table
```bash
iptables -t filter -F
```

##### Sets a Default Policy for the INPUT Chain that Drops All Incoming Packets
```bash
iptables -P INPUT DROP
```

##### Configures your FORWARD Chain to Drop All Packets
```bash
iptables -P FORWARD DROP
```

##### Disregard icmp requests
```bash
iptables -A INPUT -s 0/0 -p icmp -j DROP
```

##### Configures the Firewall to Disregard All Incoming PING packets addressed to the Local Linux System
```bash
iptables -A FORWARD -p tcp -s 0/0 –sport 80 -j ACCEPT
```

##### Configures the Firewall to Accept All Incoming Packets on eth0 coming from the 192.168.2.0 network
```bash
iptables -A INPUT -i eth0 -s 192.168.2.0/24 -j DROP
```

##### Most Admins use the **-P** options with iptables to setup the firewalls default filtering rules

##### To make rules Persistent
```bash
iptables-restore
```
  
##### if you don’t specify a table name it will default to the filter table:
**ACCEPT**
**DROP**
**QUEUE**
**REJECT**

### Configuring xinetd and inetd
Considered Linux **“super-daemons”**. Acts as an intermediary between the user requesting network services and the daemons on the system that provide the actual service. When the request has been fulfilled and the network service is no longer need, xinetd unloads the daemon from memory.

Some of the network services managed by xinetd include the following:
**chargen**
**daytime**
**echo**
**ftp**
**pop3**
**rsync**
**smtp**
**telnet**
**tftp**
**time**
**vnc**

### Configuring xinetd Network Services
Configuration files in **/etc/xinetd.d**.
After **changing** any files in **/etc/xinet.d** you need to **restart** the **xinetd daemon** using its init script in **/etc/rc.d/init.d** or **/etc/init.d**
  
### Using TCP Wrappers

##### **enable the functionality in each service’s configuration file in /etc/xinet.d. Do the following:**

**1.** Verify that the **tcpd** **package** has been **installed** on your Linux system.
**2.** **Open** the appropriate **configuration** **file** in a text editor.
**3.** **Comment** **out** the existing **server =** line from the file.
**4.** Add the following line: **server = /usr/sbin/tcpd**
This will **cause** **xinetd** to **start** the **tcpd** **daemon** **instead** of the **service** **daemon** itself.
**5.** Add the following line: **server_args = path_to_daemon**
This tells the **tcpd** **daemon** to then **run** the **requested** **network** **daemon**.
**6.** **Save** the file and **restart** the **xinetd** daemon.

Next we need to create our **access controls**. The tcpd daemon uses the **/etc/hosts.allow** and **/etc/hosts.deny** files to specify who can access the services it manages. Syntax for both of these files is:
```bash
service: host_addresses
```

configure **/etc/hosts.allow** file to allow access to the vsftpd daemon for just a few specific hosts
```bash
vsftpd: 192.168.1.10, 192.168.1.102
```

### Configuring inetd
The **inetd** daemon is a **super**-**daemon** like **xinetd**, but it is typically used on Linux distros. The inetd daemon is **configured** using the **/etc/inetd.conf** file. Syntax used in **inted.conf** shown below:
service_name socket_type protocol flags user executable arguments

##### Network Manager (Text User Inferface)
```bash
nmtui
```

##### Check what port a program is running under
```bash
sudo ss -plunt | grep influxd
```
