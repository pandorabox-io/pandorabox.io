# folder structure of the pandorabox server

Server/Application root directory `/data/pandorabox.io`
```
/data
 + /minetest
  + /world
 + /nginx
 + /postgres-minetest
 + /wiki
/doc
/docker
/scripts
docker-compose.yml
psql.sh
psql-mapserver.sh
psql-wiki.sh
create-export.sh
convert-test.sh
restart.sh
```

## restart.sh

As the name suggests, restarts the minetest-server

## convert-test.sh

Converts the server to the test-instance (url's, announce-name, /news)
**WARNING** Don't do this on the main server! This is intended to execute on a restored backup only!

## psql.sh

Starts a sql-shell on the main database (blocks, players)

## /data/minetest/world

The main directory for all things minetesty..

## /data/minetest/world/worldmods

All installed mods

## create-export.sh

Creates a server-extract with the main parts (blocks,mods,essential mod-data) to distribute
**NOTE** This will create 2 files that amount to ca. 30 GB in the folder `/export`
**WARNING** Don't do this on the main server, the daily backup _will_ replicate this!
