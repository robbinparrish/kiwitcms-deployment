#!/bin/bash

# Path where the Kiwi TCMS deployment is configured.
# NEED TO REPLACE THEASE TO CORRECT PATH.
KIWI_TCMS_DEPLOYMENT_DIR="${HOME}/kiwitcms-deployment"
KIWI_TCMS_DEPLOYMENT_BACKUP_PATH="${HOME}/kiwitcms-deployment-backup"

# Backup directory.
BACKUP_TIME=$(date "+%d%m%Y%H%M%S")
KIWI_TCMS_DEPLOYMENT_BACKUP_DIR="${KIWI_TCMS_DEPLOYMENT_BACKUP_PATH}/${BACKUP_TIME}"

cd "${KIWI_TCMS_DEPLOYMENT_DIR}" || exit 1

# Backup configuration files.
mkdir -p "${KIWI_TCMS_DEPLOYMENT_BACKUP_DIR}"
cp -av ./kiwitcms-data/uploads "${KIWI_TCMS_DEPLOYMENT_BACKUP_DIR}"/

# Create backup.
mkdir -p ./pgsql-db/backups
chown -R 1000:1000 ./pgsql-db/backups
docker-compose exec -it pgsql-db /usr/bin/pg_dumpall --clean -U postgres > ./pgsql-db/backups/pgsql-db-backup.sql
mv -fv ./pgsql-db/backups/pgsql-db-backup.sql "${KIWI_TCMS_DEPLOYMENT_BACKUP_DIR}"/
sync
 
# Compress the backup.
cd "${KIWI_TCMS_DEPLOYMENT_BACKUP_PATH}" || exit 1
tar -cvzf "${BACKUP_TIME}".tar.gz "${BACKUP_TIME}"
rm -rf "${BACKUP_TIME}"
sync

