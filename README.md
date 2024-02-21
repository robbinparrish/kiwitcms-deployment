## Disclaimer.
The content on this account/repository provided solely for educational and informational purposes.
It is not intended for use in making any kind of business, investment and/or legal decisions.
Although every effort has been made to keep the information up-to-date and accurate, no representations and/or warranties, express and/or implied, completeness, accuracy, reliability, suitability, and/or availability of the content.

## Kiwi TCMS.
This can be used to setup a Kiwi TCMS Server.  
Kiwi TCMS - https://kiwitcms.readthedocs.io/en/latest/

Since the Kiwi TCMS image default uses non-root user in image and this user does not have write permission to host directory with bind mount. Need to perform followings to make it work with bind mount.
```bash
mkdir -p ./kiwitcms-data/uploads
chown -R 1001:1001 ./kiwitcms-data
```

For backup of pgsql database we will need to create a directory and set the correct ownership.
```bash
mkdir -p ./pgsql-db/backups
chown -R 1000:1000 ./pgsql-db/backups
```

## Docker Compose Version.
Always validate that [docker-compose](https://github.com/docker/compose/releases/) version is latest.
If not then use the latest released version. As of updating this document `v2.24.0` was latest released version.

### Custom configurations.
If required then add/update custom configurations in [Custom Configuration](./configs/custom-configurations.py)

### Starting the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```

### Initial configuration setup.
- Initialize the database.
```bash
docker-compose exec -it kiwitcms /Kiwi/manage.py migrate
```

- Create initial admin user.
```bash
docker-compose exec -it kiwitcms /Kiwi/manage.py createsuperuser
```

- Refresh permissions for admin user.
```bash
docker-compose exec -it kiwitcms /Kiwi/manage.py refresh_permissions
```

- Configure domain name.
```bash
docker-compose exec -it kiwitcms /Kiwi/manage.py set_domain kiwitcms.mydomain.com
```

- Testing email configuration.
```bash
docker-compose exec -it kiwitcms /Kiwi/manage.py sendtestemail EMAIL_ADDRESS
```

### Once Initial setup is completed, we can access the webui in the browser - http://IPADDR_OF_SYSTEM

[Backup and Restore](./configs/backup-and-restore.md)

[Upgrading Kiwi TCMS](./configs/upgrading-kiwitcms.md)

