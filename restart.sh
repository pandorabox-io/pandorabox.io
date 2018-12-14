#!/bin/sh
docker-compose restart minetest
docker-compose logs -f --tail 200 minetest
