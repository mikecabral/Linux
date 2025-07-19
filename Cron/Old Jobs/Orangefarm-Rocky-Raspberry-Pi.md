```bash
#runs Sunday 11:30pm // Backs up all running servers, Prosody, Orangefarm Website>

30 22 * * 0 cd /home/pi/scripts && sh backup_server_sunday_full.sh>>/media/mycloud/backups/rockylinux/backup-sunday-full.log

  

#runs Monday 11:30pm // Backs up all running servers, Prosody, Orangefarm Website>

30 22 * * 1 cd /home/pi/scripts && sh backup_server_monday.sh>>/media/mycloud/backups/rockylinux/backup-monday-incremental.log

  

#runs Tuesday 11:30pm // Backs up all running servers, Prosody, Orangefarm Website>

30 22 * * 2 cd /home/pi/scripts && sh backup_server_tuesday.sh>>/media/mycloud/backups/rockylinux/backup-tuesday-incremental.log

  

#runs Wednesday 11:30pm // Backs up all running servers, Prosody, Orangefarm Website>

30 22 * * 3 cd /home/pi/scripts && sh backup_server_wednesday.sh>>/media/mycloud/backups/rockylinux/backup-wednesday-incremental.log

  

#runs Thursday 11:30pm // Backs up all running servers, Prosody, Orangefarm Website>

30 22 * * 4 cd /home/pi/scripts && sh backup_server_thursday.sh>>/media/mycloud/backups/rockylinux/backup-thursday-incremental.log

  

#runs Friday 11:30pm // Backs up all running servers, Prosody, Orangefarm Website>

30 22 * * 5 cd /home/pi/scripts && sh backup_server_friday.sh>>/media/mycloud/backups/rockylinux/backup-friday-incremental.log

  

#runs Saturday 11:30pm // Backs up all running servers, Prosody, Orangefarm Website>

30 22 * * 6 cd /home/pi/scripts && sh backup_server_sunday_full.sh>>/media/mycloud/backups/rockylinux/backup-saturday-incremental.log

  

#runs a test every minute

#*/1 * * * * cd /home/pi/scripts && sh hello.sh>/media/mycloud/backups/hello.log

#runs everyday at 11:59pm // Updates the Linux System

59 23 * * 0 cd /home/pi/scripts && sh auto_update.sh>>/media/mycloud/backups/rockylinux/automaticupdates.log

#13 14 * * * cd /home/pi/scripts && sh auto_update.sh>>/media/mycloud/backups/rockylinux/automaticupdates.log
```
