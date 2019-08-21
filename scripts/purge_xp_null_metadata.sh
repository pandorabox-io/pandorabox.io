#!/bin/sh
docker-compose exec postgres psql -U postgres -c "delete from player_metadata where player in (select player from player_metadata where attr = 'xp' and value = '0' limit 1000)"

