## Upgrading Kiwi TCMS to latest Stable Release.

**NOTE** - Before proceeding further please make sure that you have created a backup. If not then follow [Backup and Restore](./backup-and-restore.md) to create a backup.

### Identify the latest released version.
- https://hub.docker.com/r/kiwitcms/kiwi/tags
- https://hub.docker.com/_/postgres/tags
- https://hub.docker.com/_/nginx/tags

Once the latest released version is identified we can update the corresponding version in the [docker-compose.yml](./../docker-compose.yml) file.

As of now Kiwi TCMS does not provide any versioned image. The image with `latest` tag get replaced every time when a new image released.

### Upgrading the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```

### Upgrading Kiwi TCMS.
```bash
docker-compose exec -it kiwitcms /Kiwi/manage.py upgrade
```

### Verify that database migration is successful.
```bash
docker-compose exec -it kiwitcms /Kiwi/manage.py showmigrations
```
