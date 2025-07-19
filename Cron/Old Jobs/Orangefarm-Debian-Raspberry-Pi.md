```bash
#runs everyday 5:00am // Renews Letsencrypt Certificate

0 5 * * * root certbot renew --quiet && systemctl reload prosody apache2

  

#runs EVERYDAY 9pm // Cleaning of System Logs, Chat Logs, ect

0 21 * * * cd /home/pi/scripts && sh clean_logs.sh>>/mnt/mycloud/backups/orangefarm/clean-logs.log

  

#runs EVERYDAY 9:15pm // Audo Updates XMPP Server Prosody IM modules

15 21 * * * cd /home/pi/scripts && sh auto_update_prosody.sh>>/mnt/mycloud/backups/orangefarm/prosody-update-logs.log

  

#runs EVERYDAY at 10:45pm // Updates the Linux System

45 22 * * 0 cd /home/pi/scripts && sh auto_update.sh >> /mnt/mycloud/backups/orangefarm/automaticupdates.log

  

#runs every SUNDAY at Midnight // Updates Nextcloud

59 23 * * 0 php7.4 /var/www/nextcloud/updater/updater.phar --no-interaction

  

#runs every SUNDAY 9:30pm // FULL BACKUP all running servers, Prosody, Orangefarm Website, Nextcloud Config

10 15 * * 0 cd /home/pi/scripts && sh backup_server_sunday_full.sh>>/mnt/mycloud/backups/orangefarm/backup_full.log

  

#runs every MONDAY 9:30pm // INCREMENTAL BACKUP Backs up all running servers, Prosody, Orangefarm Website, Nextcloud Config

10 15 * * 1 cd /home/pi/scripts && sh backup_server_monday.sh>>/mnt/mycloud/backups/orangefarm/backup_incremental-monday.log

  

#runs every TUESDAY 9:30pm // INCREMENTAL Backs up all running servers, Prosody, Orangefarm Website, Nextcloud Config

10 15 * * 2 cd /home/pi/scripts && sh backup_server_tuesday.sh>>/mnt/mycloud/backups/orangefarm/backup_incremental-tuesday.log

  

#runs every WEDNESDAY 9:30pm // INCREMENTAL Backs up all running servers, Prosody, Orangefarm Website, Nextcloud Config

10 15 * * 3 cd /home/pi/scripts && sh backup_server_wednesday.sh>>/mnt/mycloud/backups/orangefarm/backup_incremental-wednesday.log

  

#runs every THURSDAY 9:30pm // INCREMENTAL Backs up all running servers, Prosody, Orangefarm Website, Nextcloud Config

10 15 * * 4 cd /home/pi/scripts && sh backup_server_thursday.sh>>/mnt/mycloud/backups/orangefarm/backup_incremental-thursday.log

  

#runs every FRIDAY 9:30pm // INCREMENTAL Backs up all running servers, Prosody, Orangefarm Website, Nextcloud Config

10 15 * * 5 cd /home/pi/scripts && sh backup_server_friday.sh>>/mnt/mycloud/backups/orangefarm/backup_incremental-friday.log

  

#runs every SATURDAY 9:30pm // INCREMENTAL Backs up all running servers, Prosody, Orangefarm Website, Nextcloud Config

10 15 * * 6 cd /home/pi/scripts && sh backup_server_saturday.sh>>/mnt/mycloud/backups/orangefarm/backup_incremental-saturday.log
```
