##### Nextcloud Disabling Maintenance Mode to fix problems
```bash
sudo -u www-data php /var/www/nextcloud/occ maintenance:mode –off
```

##### Update Nextcloud Terminal
```bash
sudo -u www-data php7.4 updater/updater.phar --no-interaction
```

##### Update PHP to 7.4
```bash
sudo -u www-data php7.4 /var/www/nextcloud/occ upgrade
```
second command is for a big version update...