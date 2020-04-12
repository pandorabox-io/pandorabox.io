#!/bin/sh

echo "say Maintenance-restart, sorry for the interruption" > data/minetest/world/shell.txt 
sleep 5
echo "shutdown 120 true maintenance" > data/minetest/world/shell.txt
sleep 110
docker-compose stop minetest
rm data/minetest/world/luaentities
docker-compose up -d minetest

