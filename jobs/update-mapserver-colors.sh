#!/bin/sh

cd $(dirname $0)
cd ../data/Colors.txt

git remote update
git diff --exit-code HEAD origin/master && exit 0

git pull
cp colors.txt ../minetest/world/

docker-compose restart mapserver
