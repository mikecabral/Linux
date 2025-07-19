### **Using RPM**

##### Check RPM Signatures
```bash
rpm –checksig pure-ftpd-1.0.28-1.4.x86_64.rpm
```

##### Install RPM Package
```bash
rpm -i package_filename
```

##### Install directly from the Internet (if you have the full URL)
```bash
rpm -i https://github.com/releases/pure-ftpd-1.0.28-1.4.x86_64.rpm
```

##### Install with Visual Cues
```bash
rpm -ihv pure-ftpd-1.0.28-1.4.x86_64.rpm
```

**-h** option tells to print hash marks on the screen as a progress indicator.
**-v** option tells rpm to operate verbosely

##### Uninstall RPM Package
```bash
rpm -e gftp
```

##### Upgrade an RPM Package
```bash
rpm -U pure-ftpd-1.0.28-1.4.x86_64.rpm
```

##### List All Packages Installed on the System
```bash
rpm -qa
```

##### QUERY: displays a list of packages that require the postfix package
```bash
rpm -q –whatrequires postfix
```

##### Displays the Functionality the Specified Package Supplies**
```bash
rpm -q –provides postfix
```

##### Displays the Functionality by the Specified Package
```bash
rpm -q –requires postfix
```

##### What package Provides a particular Requirement
```bash
rpm -q whatprovides utility_name
```

##### Verifying Packages
```bash
rpm -V gftp
```

##### Verify ALL Packages
```bash
rpm -Va
```

##### Extracting Files from Packages
```bash
rpmc2pio package_name > archive_filename
```
##### Example
```bash
rpm2cpio gftp-2.0.19-7.1.x86_64.rpm > gftp.cpio
```
