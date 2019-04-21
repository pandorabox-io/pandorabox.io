#!/bin/sh

echo -n "Enter 'YES' to convert to test system: "
read tmp
test "$tmp" != "YES" && exit 1

echo "Converting to test system in 5 seconds..."
sleep 5

sed -i 's/pandorabox.io/test.pandorabox.io/' docker-compose.yml
sed -i 's/pandorabox.io/test.pandorabox.io/' data/minetest/minetest.conf
sed -i 's/Pandorabox/Pandorabox-TEST/' data/minetest/minetest.conf

echo "Pandorabox TEST-Server, don't build here!!!" > data/minetest/world/news.txt
