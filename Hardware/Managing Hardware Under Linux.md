Every **hard** **disk** **drive** has several parameters that are collectively called the **drive’s** _**geometry**_. The parameters that compose the drive geometry include the following:  
  
**Heads -** Refers to the number of **read/write heads** in the drive.**Cylinders -** Refers to the concentric **parallel** **tracks** on all sides of **all** **platters** in the hard disk drive. Imagine a hollow cylinder that penetrates down through all of the platters in a hard drive. Depending on how wide the cylinder is, you can fit a certain number of progressively wider cylinders, beginning in the center of the platters and working your way outward to the edge, within the drive platters.**Sectors Per Track -** Refers to the **number** of **wedges** the platters have been **divided** **into**. In addition to creating imaginary cylinders in the drive, you can also slice each platter up into imaginary pie-shaped wedges.

#### **Interrupt Request Channels**
**255** Lines of interrupt signals
**Interrupts 0, 1** and **8** are **HARDWIRED**. They **cannot** be **changed**. ****

**IRQ 0** – System timer ****
**IRQ 1** – Keyboard ****
**IRQ 3** – COM 2
**IRQ 4** – COM 1
**IRQ 5** – LPT 2
**IRQ 6** – Floppy drive
**IRQ 7** – LPT 1
**IRQ 8** – Real-time clock ****

I/O Ports **65,535**, No two devices can use the same channel.

--------------------------------------------------------
**Default I/O port assignments include the following:**

**0000h** – DMA controller
**0020h** – PIC 1
**0030h** – PIC 2
**0040h** – System timer
**0060h** – Keyboard
**0070h** – CMOS clock
**00C0h** – DMA controller
**00F0h** – Math co-processor
**0170h** – Secondary IDE hard disk controller
**01F0h** – Primary IDE hard disk controller
**0200h** – Joystick
**0278h** – LPT2
**02E8h** – COM4
**02F8h** – COM2
**0378h** – LPT1
**03E8h** – COM3
**03F0h** – Floppy disk drive controller
**03F8h** – COM1

#### **Linux Drivers**
**Kernel modules** have **.ko** or **.o** extension
/lib/modules/kernel_version/kernel/drivers

#### **Managing Kernel Modules**
**most processes /proc directory | use cat to view**

```bash
cat process
```

**cpuinfo** – **details** about the **CPU** installed in the system
**devices** – contains a list of **devices** **installed** in the system
**dma** – contains a list of **DMA** **channel** **assignments** in the system
**interrupts** – contains a list of **IRQ** **assignments** in the system
**iomem** – contains a list of **I/O port assignments** in the system
**modules** – contains a list of all the **kernel modules** currently **being** **used** by the system.
**version** – contains information about the **version** of the **Linux kernel** running on the system
**/scsi/** - contains files that hold **info** about **SCSI devices** in your system if you’re using SCSI adapter
**/bus/devices** – contains information about the **USB devices** in the system
**/sys/block** – contains a **symbolic** **link** file for **each** **block** **device** in the system
**/sys/bus** – contains a directory for **each** **data bus** in the system, including **PCI**, **SCSI**, and **USB** busses
**/sys/class** – contains **all** **device** **classes** available
**/sys/devices** – contains an entry for **every** **discovered** **device**
**/sys/module** – contains sub directories for **each** **module** **loaded** into the **kernel**

#### **View information about hardware using variety of CLI tools**

**hdparam /dev/device** – displays information about your hard drive
**sg_scan** – **scans** your **SCSI bus** and **lists** all **devices** **connected** to your SCSI controller
**sginfo -l** – also **lists** all **connected** **SCSI** **devices**
**lsusb** – displays **information** about **USB** **devices** connected to your Linux System
**hwinfo** – displays a **comprehensive** **overview** of the **system** **hardware**. It probes hardware and **generates** a system **overview** **report**. Use the **–device option** for a **limited** **report**. Full reports are massive.
**lspci** – lists all **PCI** **devices** installed in the system. Can use the **-k option** to see the **kernel** **modules** **associated** with each device

##### To view more Information about a particular Loaded Module, you can use modinfo
```bash
modinfo module_name
```
##### Example
```bash
modinfo joydev
```

##### To load a kernel module, you first need to run depmod
**depmod builds** a file named **modules.dep** stored in **/lib/modules/kernel/version/**
```bash
insmod module_filename
```

##### Load Module for Standard PC parallel port**
```bash
insmod /lib/modules/version/kernel/drivers/paraport/paraport_pc.ko
```

##### Most Admins use modprobe instead
```bash
modprobe module_name
```

**make modules persistent across reboots**
edit the /etc/modprobe.conf if doesn’t exist will use files located in /etc/modprobe.d directory

##### unload a module
```bash
modprobe -r module_name
```
