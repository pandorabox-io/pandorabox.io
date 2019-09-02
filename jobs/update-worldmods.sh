#!/bin/sh

cd $(dirname $0)
cd ../data/minetest/world/worldmods

git remote update
git diff --exit-code HEAD origin/master && exit 0

git pull

# new mods
git submodule init

# changed repo urls
git submodule sync

# updated commits
git submodule update

# removed directories
git clean -dff

