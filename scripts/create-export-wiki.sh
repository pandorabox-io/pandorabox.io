#!/bin/sh

mkdir export

# start database
docker-compose up -d postgres
sleep 10

docker-compose exec postgres pg_dump -U postgres -n mediawiki wiki | gzip > export/wiki.sql.gz

# stop database
docker-compose down

# tar archive of the mediawiki
cd data/wiki && tar cvjf ../../export/wiki.tar.bz2 --exclude LocalSettings.secrets.php *
