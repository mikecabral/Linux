#### **The Linux Boot Process**
1. The **kernel** **initializes** the **basic** **hardware** in your system using the **various** **settings** in your BIOS and your CMOS chips.  
2. The **kernel** **searches** for and uses the **initrd** or **initramfs** **file** **system** to **run** the **linuxrc** **program** to set up the system.  
3. When **linuxrc** has **finished** **executing**, the **initrd** or **initramfs** file system is **dismounted** and the **ramdisk** is **destroyed**.  
4. The **kernel** **probes** for **new** **hardware** and **loads** the **appropriate** **driver** **modules**.  
5. The **real** **root** (/) file system is **mounted**.  
6. The **kernel** **loads** the **init** or **systemd** **process**.