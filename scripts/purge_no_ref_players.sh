#!/bin/sh
docker-compose exec postgres psql -U postgres -c "delete from player where name not in (select player from player_metadata group by player);"

