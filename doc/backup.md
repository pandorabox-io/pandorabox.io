
# Server backup replication

## Methodology

Backups are taken daily with the help of lvm snapshots.
Here the backup-script from a host on the private cluster:

```sh
#!/bin/sh
cd $(dirname $0)

# prepare variables
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
REMOTE=root@pandorabox.io

# create the LVM-snapshot on the main server
ssh $REMOTE "/sbin/lvcreate -l 90%FREE -s -n backup /dev/mapper/vg0-data"

# mount the snapshot data read-only (remote)
ssh $REMOTE "mount -o ro /dev/mapper/vg0-backup /mnt/snapshot/"

# rsync the snapshotted directory tree
rsync -avz --bwlimit 8000 --delete ${REMOTE}:/mnt/snapshot/pandorabox.io/ /backup/pandorabox.io/

# cleanup
ssh $REMOTE "umount /mnt/snapshot"
ssh $REMOTE "lvremove /dev/mapper/vg0-backup -f"

# create incremental backups with borg
borg create --ignore-inode .::${TIMESTAMP} /backup/pandorabox.io

# prune old backups
borg prune . --keep-daily 5 --keep-monthly 3 --keep-yearly 10
```

**NOTE**: The snapshot volume fills up with data during the backup process