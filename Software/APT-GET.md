#### **Using Apt-Get**  

```bash
apt-get options command package_name
```

**install** – installs the latest version of a specified package**remove** – removes the specified 
package

```bash
apt install package_name
```

**update** – displays the updated information about all packages in your configured package repos

```bash
apt update
```

**upgrade** – upgrades all installed packages to the newest version

```bash
apt upgrade
```

**dist-upgrade** – upgrades all installed packages to the newest version, but avoids upgrading packages if the upgrade would break a dependency

```bash
apt dist-upgrade
```

**check** – verifies the integrity of installed packages as well as the package database

```bash
apt check
```

**clean** – removes outdated information from the package database

```bash
apt clean
```
