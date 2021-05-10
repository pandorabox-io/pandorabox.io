#!/bin/bash

mkdir export

# start database
docker-compose up -d postgres
sleep 10

# migrate players and map to slite3
docker-compose run --rm minetest minetestserver --migrate-players sqlite3 --world /data/world
docker-compose run --rm minetest minetestserver --migrate sqlite3 --world /data/world

# write "normalized" world.mt
cat > data/minetest/world/world.mt << EOF
gameid = minetest
backend = sqlite3
creative_mode = false
enable_damage = true
player_backend = sqlite3
auth_backend = sqlite3
EOF

# copy minetest.conf (for completeness)
cp minetest.conf data/minetest/world/

# stop database
docker-compose down

# tar archive of the world files
cd data/minetest/world && tar cvjf ../../../export/pandorabox.tar.bz2 \
 --exclude mails \
 --exclude mapserver.tiles \
 --exclude mapserver.json \
 --exclude xban.db \
 --exclude mod_storage *
