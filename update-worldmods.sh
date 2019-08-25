#!/bin/sh

cd data/minetest/world/worldmods

git remote update
git diff --exit-code HEAD origin/master && exit 0

git pull
git submodule init
git submodule sync
git submodule update

