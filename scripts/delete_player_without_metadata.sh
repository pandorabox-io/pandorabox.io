#!/bin/sh
docker-compose exec postgres psql -U postgres -c "delete from player where name in (select name from player where (select count(*) from player_metadata where player = name) = 0 limit 1000);"

