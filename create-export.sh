#!/bin/sh

mkdir export

docker-compose exec postgres pg_dump -U postgres postgres | gzip > export/blocks.sql.gz

cd data/minetest/world && tar cvjf ../../../export/world.tar.bz2 --exclude .git --exclude monitoring --exclude webmail advtrains* areas.dat atm_* beds_spawns datastorage/ elevator env_meta.txt force_loaded.txt locator_beacons.txt map_meta.txt mod_travelnet.data planets.json pvp_areas_store.dat teleport_tubes world.mt worldmods*

cat data/minetest/minetest.conf | grep -v key > export/minetest.conf
