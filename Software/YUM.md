### **Using YUM**

##### **/etc/yum.conf**  
##### **/etc/yum.repos.d/**

##### Install a Package
```bash
yum install package_name
```

##### Remove a Package
```bash
yum remove package_name
```

##### Lists All Packages in a repo and packages installed 
```bash
yum list all
```

##### Lists All Packages INSTALLED
```bash
yum list all
```

##### Searches Repo for Specified Package
```bash
yum list package_name
```

##### Lists all Packages Available for Installation in Configured Repo
```bash
yum list available
```

##### List of Updates of All Installed Packages
```bash
yum list updates
```

##### Checks for Updates for a Specific Package
```bash
yum list update package_name
```

##### Displays Info about Specific Package
```bash
yum info package_name
```

##### Indentifies the RPM package that provides the specified file
```bash
yum whatprovides path/filename
```

##### Download but NOT Install
```bash
yum downloader package_name
```
