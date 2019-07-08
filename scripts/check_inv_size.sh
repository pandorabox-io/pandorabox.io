#!/bin/sh
docker-compose exec postgres psql -U postgres -c "select player, inv_id, length(item) as size from player_inventory_items where player in (select name from player order by modification_date desc limit 20) order by size desc limit 30"
