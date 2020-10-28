#!/bin/sh

mkdir export

# export blocks and wiki-db as gzipped sql dump
docker-compose up -d postgres
sleep 10
docker-compose exec postgres pg_dump -U postgres -t blocks postgres | gzip > export/blocks.sql.gz
docker-compose exec postgres pg_dump -U postgres -n mediawiki wiki | gzip > export/wiki.sql.gz
docker-compose down

# tar archive of the world files
cd data/minetest/world && tar cvjf ../../../export/world.tar.bz2 \
 --exclude mails \
 --exclude mapserver.tiles \
 --exclude mapserver.json \
 --exclude xban.db \
 --exclude mod_storage *

# tar archive of the mediawiki
cd data/wiki && tar cvjf ../../export/wiki.tar.bz2 --exclude LocalSettings.secrets.php *
