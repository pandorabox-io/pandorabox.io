docker-compose stop minetest

mv data/minetest/world/luaentities data/minetest/world/luaentities.bak
mv data/minetest/world/mesecon_actionqueue data/minetest/world/mesecon_actionqueue.bak

docker-compose start minetest && docker-compose logs -f --tail 200 minetest

