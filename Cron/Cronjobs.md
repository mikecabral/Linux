##Install Cron
```bash
apt install cron
```
Or
```bash
yum install cron
```
Or
```bash
dnf install cron
```
Or
```
zypper install cron
```

##Enable Cron to Start at Boot
```bash
systemctl enable cron
```

[minute] [hour] [day_of_month] [month] [day_of_week] [user] [command_to_run]

```bash
0 3 * * 5 root
```
**For example**, you can run a backup of all your user accounts at 5 a.m every week with:

```bash
0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
```

#### **Enter Crontab**
```bash
sudo crontab -e
```

_**my actual cron jobs on orangefarm**_ _(nextcloud runs an update every SUN at 11:59pm)