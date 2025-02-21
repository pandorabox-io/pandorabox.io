#!/bin/bash
set -e

update-git /data/minetest/world/worldmods master >> /data/update-log.txt &
update-git /data/pandorabox-textures/ master >> /data/update-log.txt &
update-git /data/minetest/world/worldmods/skinsdb/textures master >> /data/update-log.txt &