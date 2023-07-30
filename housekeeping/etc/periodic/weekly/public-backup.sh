#!/bin/sh
set -e

# destination directory
BACKUP_DIR="/data/backup"

# world stuff
WORLD_FILES="map_meta.txt env_meta.txt"
# areas
WORLD_FILES="${WORLD_FILES} priv_areas.dat xp_areas.dat areas.dat"
# mod stuff
WORLD_FILES="${WORLD_FILES} teleport_tubes mesecon_actionqueue luaentities locator_beacons.txt advtrains*"

# create world file archive
cd /data/minetest/world
tar cvjf ${BACKUP_DIR}/world_files.tar.bz2 ${WORLD_FILES}

# blocks dump
pg_dump -U postgres -t blocks | gzip > ${BACKUP_DIR}/blocks.sql.gz
