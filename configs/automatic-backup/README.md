# Perform an automatic backup of Kiwi TCMS Deployment.

## Copy backup script.
```bash
cp -a kiwitcms-deployment-backup.sh /usr/bin/
chmod +x /usr/bin/kiwitcms-deployment-backup.sh
```

## Update the configuration path in the backup script.
Update following in `/usr/bin/kiwitcms-deployment-backup.sh`
```
KIWI_TCMS_DEPLOYMENT_DIR="${HOME}/kiwitcms-deployment"
KIWI_TCMS_DEPLOYMENT_BACKUP_PATH="${HOME}/kiwitcms-deployment-backup"
```

## Copy systemd unit and timer files.
```bash
cp kiwitcms-deployment-backup.timer kiwitcms-deployment-backup.service /etc/systemd/system/
```

## Enable the timer.
```bash
systemctl daemon-reload
systemctl enable kiwitcms-deployment-backup.timer
```