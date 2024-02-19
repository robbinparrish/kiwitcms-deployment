## Backup and Restore.

### Backup Kiwi TCMS instance.
Since Kiwi TCMS stores all data in the `pgsql` database so we will need to backup the whole database.

All backups are stored in `./pgsql-db/backups` directory.  
Along with the backup following directories must be `manually` backed up.  
```
./kiwitcms-data/uploads
```

For backup of pgsql database we will need to create a directory and set the correct ownership.
```bash
mkdir -p ./pgsql-db/backups
chown -R 1000:1000 ./pgsql-db/backups
```

#### Triggering Backup.
Run following command to trigger the backup.
This will create a `.sql` file containing database.
```bash
docker-compose exec -it pgsql-db /usr/bin/pg_dumpall \
 --clean -U postgres > ./pgsql-db/backups/pgsql-db-backup.sql
```

#### Triggering Restore.
Followings conditions must be met for restore.
- A working Kiwi TCMS instance.

#### Restore.
- Stop the Kiwi TCMS container.
```bash
docker-compose down kiwitcms
```

- Restore/Copy the configuration files.
```
First remove existing directories.
./kiwitcms-data/uploads

Now copy backed up directories.
Copy uploads to ./kiwitcms-data/uploads
```

- Copy the postgresql backup file for restore.
```
Copy pgsql-db-backup.sql file to ./pgsql-db/backups directory.
```

- Restore the postgresql backup.
```bash
docker-compose exec -it pgsql-db psql -U postgres -f /var/lib/postgresql/backups/pgsql-db-backup.sql
```

### Stop all the container.
```
docker-compose down
```

### Starting the container.
```
docker-compose up -d
```

### Checking the container logs.
```
docker-compose logs -f
```

#### Once Backup is restored login to the Kiwi TCMS instance and verify that all configurations and data are restored.

