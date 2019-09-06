
# Disaster recovery procedure

## Packages
```bash
apt install git docker.io docker-compose
```

## Hostname
```bash
echo pandorabox > /etc/hostname
```

## Partitions
```
Disk /dev/sda: 480 GiB, 515396075520 bytes, 1006632960 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 7C397D76-5FDF-AD44-BA49-97EB4FA4D146

Device        Start        End   Sectors  Size Type
/dev/sda1      2048       6143      4096    2M BIOS boot
/dev/sda2      6144    2103295   2097152    1G Linux filesystem
/dev/sda3   2103296   20971486  18868191    9G Linux filesystem
/dev/sda4  20971520 1006630912 985659393  470G Linux LVM
```

## LVM
```
pvcreate /dev/sda4 
vgcreate vg-01 /dev/sda4
lvcreate -L 400G -n data vg-01
mkfs.ext4 /dev/mapper/vg--01-data
mkdir /data
```

## /etc/fstab
```
/dev/mapper/vg--01-data /data   ext4    defaults,noatime        0 0
```

## Directories
* mt-files in /data/pandorabox.io

## Docker config

/etc/docker/daemon.json:
```json
{
  "ipv6": true,
  "fixed-cidr-v6": "2001:db8:1::/64"
}
```

Autostart:
```bash
systemctl enable docker
```

## Git config
/root/.gitconfig
```
[user]
	mail = thomas@rudin.io
	name = Thomas Rudin
	email = thomas@rudin.io

```

## Stacks

```bash
docker login registry.rudin.io
```

### Terminator
```bash
cd /data && git clone https://git.rudin.io/infra/terminator.git
docker network create terminator
cd /data/terminator && docker-compose up -d
```

### Minetest
```bash
cd /data/pandorabox.io && docker-compose up -d
```

## Crontab
```
# m h  dom mon dow   command
* * * * * /data/pandorabox.io/jobs/update-worldmods.sh
0 * * * * /data/pandorabox.io/jobs/update-mapserver-colors.sh
```
